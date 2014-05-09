module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in User.create(name: 'TESt', email: 'test@test.com', password: '12341234', password_confirmation: '12341234', admin: true)
    end
  end
end