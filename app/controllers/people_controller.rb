class PeopleController < ApplicationController
  def index

  end

  def new
    @person = Person.new
  end

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

  def edit

  end

  def update

  end

  def show
    @person = Person.find(params[:id])
  end

  def destroy

  end

  private
  def person_attrs
    params.require(:person).permit(:username,:tag_names)
  end
end
