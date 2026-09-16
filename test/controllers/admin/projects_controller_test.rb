require "test_helper"

class Admin::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "index responds successfully" do
    get admin_projects_path

    assert_response :success
  end

  test "creates project with skills" do
    ruby = skills(:one)
    rails = skills(:two)

    post admin_projects_path, params: {
      project: {
        name: "Test Project",
        summary: "Test summary",
        description: "Test description",
        skill_ids: [ ruby.id, rails.id ]
      }
    }

    project = Project.find_by(name: "Test Project")

    assert_equal [ ruby.id, rails.id ].sort, project.skill_ids.sort
  end

  test "updates project skills" do
    ruby = skills(:one)
    rails = skills(:two)

    project = Project.create!(
      name: "Test Project",
      summary: "Test summary",
      description: "Test description",
      skill_ids: [ ruby.id, rails.id ]
    )

    patch admin_project_path(project), params: {
      project: {
        skill_ids: [ ruby.id ]
      }
    }

    project.reload

    assert_equal [ ruby.id ], project.skill_ids
  end
end
