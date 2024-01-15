/// Tells the type of images from the images string list
enum ImageType {
  /// Images are url
  url,

  /// Images are assets
  asset,

  /// Images are base64 encoded string
  bytes,

  /// Images are files paths from system
  file
}
