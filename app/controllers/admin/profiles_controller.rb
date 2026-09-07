class Admin::ProfilesController < ApplicationController
    before_action :set_profile, only: %i[show edit update destroy]

    def show
        redirect_to new_admin_profile_path unless @profile
    end

    def new
        if Profile.exists?
            redirect_to admin_profile_path
        else
            @profile = Profile.new
        end
    end

    def create
        if Profile.exists?
            redirect_to admin_profile_path
            return
        end

        @profile = Profile.new(profile_params)

        if @profile.save
            redirect_to admin_profile_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @profile.update(profile_params)
            redirect_to admin_profile_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @profile.destroy

        redirect_to new_admin_profile_path
    end

    private

    def set_profile
        @profile = Profile.first
    end

    def profile_params
        params.require(:profile).permit(
            :display_name,
            :job_title,
            :introduction,
            :contact_email
        )
    end
end
