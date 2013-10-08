require 'spec_helper'

describe Post do
  it {should belong_to(:user)}
  it {should ensure_length_of(:title).is_at_least(5)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:body)}
end
