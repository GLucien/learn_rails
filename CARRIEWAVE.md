carriewave gem 用于实现文件上传
如下是如何使用：
1.在Gemfile中添加gem,如下:
    gem 'carrierwave'
2.bundle之后,重启server
3.为项目生成uploader,生成的文件位于app/uploaders/avatar_uploader.rb
    rails generate uploader Avatar
4.选择要使用的存储类型
