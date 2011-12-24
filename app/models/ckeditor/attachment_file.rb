class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => "/files/ckeditor/attachments/:id/:filename",
                    :path => ":rails_root/public/files/ckeditor/attachments/:id/:filename"
  
  validates_attachment_size :data, :less_than => 10.megabytes
  validates_attachment_presence :data
	
	def url_thumb
	  @url_thumb ||= begin
	    extname = File.extname(filename).gsub(/^\./, '')
      "/javascripts/ckeditor/filebrowser/images/thumbs/#{extname}.gif"
	  end
	end
end
