module ApplicationHelper
 def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?
     
    unless user.provider.blank?
     img_url = user.image_url
    else
     img_url = 'no_image.png'
     size = "150x150"
    end
   image_tag(img_url, alt: user.name, :size => size)
   #image_tag(img_url, alt: user.name, :size => "100x100")
 end
end
