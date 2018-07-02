require "application_system_test_case"

class MonkeysTest < ApplicationSystemTestCase
  setup do
    @monkey = monkeys(:one)
  end

  test "visiting the index" do
    visit monkeys_url
    assert_selector "h1", text: "Monkeys"
  end

  test "creating a Monkey" do
    visit monkeys_url
    click_on "New Monkey"

    click_on "Create Monkey"

    assert_text "Monkey was successfully created"
    click_on "Back"
  end

  test "updating a Monkey" do
    visit monkeys_url
    click_on "Edit", match: :first

    click_on "Update Monkey"

    assert_text "Monkey was successfully updated"
    click_on "Back"
  end

  test "destroying a Monkey" do
    visit monkeys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Monkey was successfully destroyed"
  end
end
