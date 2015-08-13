feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = create :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'with a password that does not match' do
    user = create :user, password_confirmation: 'wrong'
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'without an email in the field' do
    user = create :user, email: ''
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'You must fill in a valid email'
  end

  scenario 'I cannot sign up' do

  end

  def sign_up(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end
end
