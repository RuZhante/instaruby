class ImageUploader < Shrine
  # plugins and uploading logic
  plugin :default_url
 
  Attacher.default_url do |**options|
  "/placeholders/missing.jpg"
  end
end
