class Admin::SkillsController < ApplicationController
  def index
    @skills = Skill.order(:position)
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(
      skill_params.merge(position: Skill.maximum(:position).to_i + 1)
      )

    if @skill.save
      redirect_to admin_skills_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])

    if @skill.update(skill_params)
      redirect_to admin_skills_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    redirect_to admin_skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end
end
