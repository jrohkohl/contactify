require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:one)
  end

  test "visiting the index" do
    visit contacts_url
    assert_selector "h1", text: "Contacts"
  end

  test "creating a Contact" do
    visit contacts_url
    click_on "New Contact"

    fill_in "Email", with: @contact.email
    fill_in "Facebook url", with: @contact.facebook_url
    fill_in "Image", with: @contact.image
    fill_in "Instagram url", with: @contact.instagram_url
    fill_in "Name", with: @contact.name
    fill_in "Organization", with: @contact.organization
    fill_in "Owner", with: @contact.owner_id
    fill_in "Personal number", with: @contact.personal_number
    fill_in "Preferred method", with: @contact.preferred_method
    fill_in "Work number", with: @contact.work_number
    click_on "Create Contact"

    assert_text "Contact was successfully created"
    click_on "Back"
  end

  test "updating a Contact" do
    visit contacts_url
    click_on "Edit", match: :first

    fill_in "Email", with: @contact.email
    fill_in "Facebook url", with: @contact.facebook_url
    fill_in "Image", with: @contact.image
    fill_in "Instagram url", with: @contact.instagram_url
    fill_in "Name", with: @contact.name
    fill_in "Organization", with: @contact.organization
    fill_in "Owner", with: @contact.owner_id
    fill_in "Personal number", with: @contact.personal_number
    fill_in "Preferred method", with: @contact.preferred_method
    fill_in "Work number", with: @contact.work_number
    click_on "Update Contact"

    assert_text "Contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact" do
    visit contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact was successfully destroyed"
  end
end
