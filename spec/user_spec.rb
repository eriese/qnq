require "spec_helper"

describe User do
  it "initializes through facebook" do
    visit("/")
    click_link "Sign in with Facebook"
    expect(current_path).to eq("https://www.facebook.com/login.php?skip_api_login=1&api_key=717561474938198&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fdialog%2Foauth%3Fredirect_uri%3Dhttp%253A%252F%252Flocalhost%253A3000%252Fauth%252Ffacebook%252Fcallback%26state%3D30ae83d880d10bd5e2a45c900c192c602f652b83eb4b2dcd%26scope%3Demail%26response_type%3Dcode%26client_id%3D717561474938198%26ret%3Dlogin&cancel_uri=http%3A%2F%2Flocalhost%3A3000%2Fauth%2Ffacebook%2Fcallback%3Ferror%3Daccess_denied%26error_code%3D200%26error_description%3DPermissions%2Berror%26error_reason%3Duser_denied%26state%3D30ae83d880d10bd5e2a45c900c192c602f652b83eb4b2dcd%23_%3D_&display=page")
  end
end
