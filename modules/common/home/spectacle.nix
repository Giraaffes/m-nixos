{ ... }:
{
  xdg.configFile."spectaclerc" = {
    text = ''
      [General]
      autoSaveImage=true
      clipboardGroup=PostScreenshotCopyImage
      useReleaseToCapture=true

      [ImageSave]
      translatedScreenshotsFolder=Screenshots

      [VideoSave]
      translatedScreencastsFolder=Screencasts
    '';
    force = true;
  };
}