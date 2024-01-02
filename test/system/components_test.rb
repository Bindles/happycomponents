require "application_system_test_case"

class ComponentsTest < ApplicationSystemTestCase
  setup do
    @component = components(:one)
  end

  test "visiting the index" do
    visit components_url
    assert_selector "h1", text: "Components"
  end

  test "should create component" do
    visit components_url
    click_on "New component"

    fill_in "Category", with: @component.category
    fill_in "Code", with: @component.code
    fill_in "Desc", with: @component.desc
    fill_in "Lang", with: @component.lang
    fill_in "Name", with: @component.name
    click_on "Create Component"

    assert_text "Component was successfully created"
    click_on "Back"
  end

  test "should update Component" do
    visit component_url(@component)
    click_on "Edit this component", match: :first

    fill_in "Category", with: @component.category
    fill_in "Code", with: @component.code
    fill_in "Desc", with: @component.desc
    fill_in "Lang", with: @component.lang
    fill_in "Name", with: @component.name
    click_on "Update Component"

    assert_text "Component was successfully updated"
    click_on "Back"
  end

  test "should destroy Component" do
    visit component_url(@component)
    click_on "Destroy this component", match: :first

    assert_text "Component was successfully destroyed"
  end
end
