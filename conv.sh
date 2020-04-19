ruby -e 'require "jekyll-import";
JekyllImport::Importers::WordpressDotCom.run({
  "source" => "../wpexp.xml",
  "no_fetch_images" => false,
  "assets_folder" => "assets/images"
})'
