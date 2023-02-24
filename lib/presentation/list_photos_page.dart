import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/presentation/widgets/button_widget.dart';
import '/presentation/widgets/dialog_widget.dart';
import '/domain/entities/photo.dart';
import '/presentation/widgets/item_photo.dart';
import '/application/provider.dart';

/// Main widget that paints the paginated list of photos and displays the posts
/// error depending on the case
class ListPhotosPage extends ConsumerStatefulWidget {
  const ListPhotosPage({Key? key}) : super(key: key);

  @override
  ListPhotosPageState createState() => ListPhotosPageState();
}

class ListPhotosPageState extends ConsumerState<ListPhotosPage> {
  late ScrollController _controllerListView;

  /// Flag to prevent the request to get photos from being repeated
  /// because the listener of [_controllerListView] is activated
  /// twice.
  bool _preventRepeatedDownload = false;

  /// Flag that is activated when the internet connection is lost
  /// this is used in [_subscriptionInternetConnectionRecovery] to determine
  /// whether to get the photos automatically when
  /// the internet connection is recovered.
  bool _lostConnection = false;

  /// Flag that is activated when the dialog indicating that the
  /// internet connection is not available
  ///
  /// Used in [_subscriptionInternetConnectionRecovery] to close the dialog
  /// automatically when the internet connection is restored
  BuildContext? contextDialogNotConnection;

  /// Stream that listens for changes in the internet connection
  /// and is used to automatically call getphotos
  /// and close connectivity error messages.
  late StreamSubscription _connectivityStatus;

  /// Get the photos from the server
  void getPhotos({nextPage = true}) {
    ref.read(listPhotosNotifier.notifier).getPhotos(nextPage: nextPage);
  }

  /// Method that is called each time a [getPhotos] is performed from
  /// successful way, this updates the list that is being displayed in
  /// screen.
  void updateCachePhotos(List<Photo> pagePhotos) {
    final currentPhotos = ref.read(listPhotosCached.notifier).state;
    ref.read(listPhotosCached.notifier).state = [
      ...currentPhotos,
      ...pagePhotos
    ];
  }

  /// Method that determines if the user reached the end of the list by means of
  /// of the ScrollPosition and if so, make the call to obtain new
  /// photos.
  void _onScrollUpdate() {
    var maxScroll = _controllerListView.position.maxScrollExtent;
    var currentPosition = _controllerListView.position.pixels;
    if (currentPosition > maxScroll - maxScroll * 0.01 &&
        currentPosition > 10) {
      if (!_preventRepeatedDownload) {
        getPhotos();
      }
    }
  }

  /// Stream to get the data automatically when the user
  /// retrieve the internet connection.
  void _subscriptionInternetConnectionRecovery() {
    _connectivityStatus = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none && _lostConnection) {
        getPhotos();
        _lostConnection = false;
        if (contextDialogNotConnection != null) {
          Navigator.pop(contextDialogNotConnection!);
          contextDialogNotConnection = null;
        }
      }
    });
  }

  /// Method that listens for the current state of listPhotosNotifier.state in this
  /// the following operations are performed:
  /// - Show dialogs for each error case.
  /// - Update the value of [cacheListPhotos] when getting the data.
  /// - Update the [_lostConnection] and [contextDialogNotConnection] flags.
  void listenSateGetPhotos(List<Photo> cacheListPhotos) {
    ref.listen(listPhotosNotifier, (_, state) {
      state.maybeWhen(
          error: (failure) {
            return failure.when(
                noConnection: (message) {
                  showDialog(
                      context: context,
                      builder: (ctxDialog) {
                        contextDialogNotConnection = ctxDialog;
                        _lostConnection = true;
                        return DialogWidget(
                          onPressedClosed: () => Navigator.pop(ctxDialog),
                          title: 'Revisa la conexión a internet',
                          icon: const Icon(
                            Icons.signal_cellular_connected_no_internet_4_bar,
                            size: 52,
                          ),
                          message:
                              'Cuando recuperes la conexión, las fotos cargaran automáticamente.',
                        );
                      });
                },
                server: (message, code) => cacheListPhotos.isNotEmpty
                    ? () {}
                    : showDialog(
                        context: context,
                        builder: (ctxDialog) {
                          _lostConnection = true;
                          contextDialogNotConnection = null;
                          return DialogWidget(
                            onPressedClosed: () => Navigator.pop(ctxDialog),
                            title: 'Error cargando las fotos',
                            icon: const Icon(
                              Icons.error_outline,
                              size: 56,
                            ),
                            message:
                                'Ocurrio un problema para descargar las fotos del servidor.\n\ncódigo de error: $code.',
                            textButton: 'Intentar de nuevo',
                            onPressed: () {
                              getPhotos();
                              Navigator.pop(ctxDialog);
                            },
                          );
                        }));
          },
          loading: () => _preventRepeatedDownload = true,
          data: (pagePhotos) {
            if (pagePhotos.isNotEmpty) {
              updateCachePhotos(pagePhotos);
              _preventRepeatedDownload = false;
            } else {
              _controllerListView.removeListener(_onScrollUpdate);
              _preventRepeatedDownload = false;
            }
          },
          orElse: () {});
    });
  }

  @override
  void initState() {
    Future.microtask(() => getPhotos());
    _controllerListView = ScrollController();
    _controllerListView.addListener(_onScrollUpdate);

    _subscriptionInternetConnectionRecovery();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cacheListPhotos = ref.watch(listPhotosCached);
    final stateGetPhotos = ref.watch(listPhotosNotifier);
    listenSateGetPhotos(cacheListPhotos);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _controllerListView,
            itemCount: cacheListPhotos.length,
            itemBuilder: (_, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: ItemPhotoWidget(
                  title: cacheListPhotos[index].title,
                  thumbnailUrl: cacheListPhotos[index].thumbnailUrl,
                ),
              );
            },
          ),
        ),
        stateGetPhotos.maybeWhen(
            error: (error) => error.maybeWhen(
                server: (_, code) => cacheListPhotos.isNotEmpty
                    ? tryAgainGetPhotosWidget(code)
                    : const SizedBox(),
                noConnection: (messageError) => containerMessageError(
                    '$messageError\n\nActiva la conexión a internet para que los datos se carguen automáticamente..',
                    Colors.amber),
                orElse: () => const SizedBox()),
            loading: () => const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
            data: (pagePhotos) {
              return pagePhotos.isEmpty
                  ? containerMessageError(
                      'Todas las fotos han sido descargadas.',
                      Colors.lightGreenAccent)
                  : const SizedBox();
            },
            orElse: () => const SizedBox())
      ],
    );
  }

  /// Paint a banner at the bottom of the screen with the [message]
  /// and a background according to [color]
  Widget containerMessageError(String message, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
      color: color,
      child: Center(
        child: Text(message,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
    );
  }

  /// Widget that paints a banner with a button to reload the photos
  /// at the bottom of the screen, this is displayed when the error
  /// occurs by the server.
  Widget tryAgainGetPhotosWidget(int code) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.white30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'Ocurrió un problema para descargar las fotos.\n código de error: $code',
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: SizedBox(
              height: 48,
              child: ButtonWidget(
                  onPressed: () => getPhotos(),
                  textButton: 'Intentar de nuevo'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllerListView.dispose();
    _connectivityStatus.cancel();
    super.dispose();
  }
}
