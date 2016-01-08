module Admin::TagsHelper
  def create_deletable_button tag
    if tag.in_use? 
      link_to '#' do 
      # <button type="button" class="disabled">Delete</button>
      content_tag(:button, 'delete', class: 'disabled')
      end
    else
      link_to admin_tag_path(tag),method: :delete, data: {confirm: 'Are you sure?'} do 
      # <button type="button">Delete</button>
      content_tag(:button, 'delete')
      end
    end 
  end
end
