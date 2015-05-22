require 'spec_helper'

describe User do
	let(:valid_attributes) {
		{
			first_name: "Vladislav",
			las_name: "Filiucov",
			email: "filiucov@mail.ru",
			password: "password123",
			password_confirmation: "password123"
		}
	}

	context "relationships" do
		it { should have_many(:todo_lists) }
	end

	context "validations" do
		let(:user) { User.new(valid_attributes) }

		before do
			User.create(valid_attributes)
		end

		it "requires an email" do
			expect(user).to validate_presence_of(:email)
		end

		it "requires a unique email" do
			expect(user).to validate_uniqueness_of(:email)
		end

		it "requires a unique email (case insensitive)" do
			user.email = "FILIUCOV@MAIL.RU"
			expect(user).to validate_uniqueness_of(:email)
		end

		it "requires the email adress to look like an email" do
			user.email = "filiucov"
			expect(user).to_not be_valid
		end
	end

	describe "#downcase_email" do
		it "makes the email attribute lower case" do
			user = User.new(valid_attributes.merge(email: "FILIUCOV@MAIL.RU"))
			expect{ user.downcase_email }.to change{ user.email }.
				from("FILIUCOV@MAIL.RU").
				to("filiucov@mail.ru")
	end
	
	it "downcases an email before saving" do
			user = User.new(valid_attributes)
			user.email = "JORAKORNEV@MAIL.RU"
			expect(user.save).to be true
			expect(user.email).to eq("jorakornev@mail.ru")
		end
	end

	describe "#generate_password_reset_token!" do
		let(:user) { create(:user) }
		it "changes the password_reset_token attribute" do
			expect{ user.generate_password_reset_token! }.to change{user.password_reset_token}
		end

		it "calls SecureRandom.urlsafe_base64 to generate_password_reset_token" do
			expect(SecureRandom).to receive(:urlsafe_base64)
			user.generate_password_reset_token!
		end
	end

  describe "#create_default_lists" do
    let(:user) { create(:user) }
    it "creates a todo list" do
      expect{ user.create_default_lists }.to change{ user.todo_lists.size }.by(1)
    end

    it "does not create the same todo list twice" do
      expect{ user.create_default_lists }.to change{ user.todo_lists.size }.by(1)
      expect{ user.create_default_lists }.to change{ user.todo_lists.size }.by(0)      
    end

    it "creates todo items" do
      expect { user.create_default_lists }.to change{ TodoItem.count }.by(7)
    end

    it "creates todo items only once" do
      expect { user.create_default_lists }.to change{ TodoItem.count }.by(7)
      expect { user.create_default_lists }.to change{ TodoItem.count }.by(0)
    end    
  end





end
