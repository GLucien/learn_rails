class Blog < ApplicationRecord
  validates :title, presence: {message: "标题不能为空"}
  validates :content, presence: {message: "内容不能为空"}
  validates :user_id, presence: {message: "用户不能为空"}

  belongs_to :user
  has_and_belongs_to_many :tags

  def tags_string= one_tags
    one_tags.split(',').each do |tag|
      one_tag = Tag.find_by(title: tag)
      one_tag = Tag.new(title: tag) unless one_tag
      # 下面的追加操作会自动帮我们保存一个新的tag,如果one_tag不存在的话
      self.tags << one_tag
    end
  end

  def content= one_content
    write_attribute :content, "-----#{one_content}----"
  end
end
