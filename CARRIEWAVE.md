carrierwave gem 用于实现文件上传
快速使用：
1. 在Gemfile中添加gem,如下:
    gem 'carrierwave'
2. bundle之后,重启server
3. 为项目生成uploader,生成的文件位于app/uploaders/avatar_uploader.rb
    rails generate uploader Avatar
4. rails g migration add_avatar_to_file_manages avatar:string
   rake db:migrate
5. 对应Model中添加 mount_uploader :avatar, AvatarUploader
6. 表单结构
    <%= form_for @file,url:file_managements_path do |f|%>
          <div class="form-group avatar-upload">
            <%= f.file_field :avatar %>
          </div>
          <button type="submit" class="btn btn-default">上传</button>
    <% end %>
   
