# README
**模型多态关联的一个列子**
1. 主要代码
```ruby
class Tag < ApplicationRecord
  belongs_to :tagable, :polymorphic => true
end

class Person < ApplicationRecord
  has_many :tags, :as => :tagable
end

class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :username
      t.timestamps
    end
  end
end

class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :tagable, :polymorphic => true #这里指明了多态，这样会生成tagable_id和tagable_type这两个字段
      t.timestamps
    end
  end
end

# people_controller
  def create
    @person = Person.new(person_attrs)
    if @person.save
      params[:person][:tag_names].split(",").each do |tag|
        one_tag = Tag.find_by(name: tag)
        one_tag = Tag.new(name: tag) unless one_tag
        # 下面的追加操作会自动帮我们保存一个新的tag,如果one_tag不存在的话
        @person.tags << one_tag
      end
      redirect_to person_path(@person)
    else
      render action: :new
    end
  end
 # people#show.html.erb
 @person.tags.map(&:name).join(',')
```