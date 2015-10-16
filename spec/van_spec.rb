describe Van do

  it "responds to collect_broken method" do
    expect(subject).to respond_to(:collect_broken).with(1).arguments
  end

end
