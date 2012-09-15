require 'test_helper'

class TalksControllerTest < ActionController::TestCase
  setup do
    @talk = talks(:one)
  end

  test "deve conseguir acessar a home" do
    get :index
    assert_response :sucess
  end

  test "deve conseguir acessar a rota new" do
    get :new
    assert_response :sucess
  end

  test "deve criar um novo talk" do
    @talk.nome = 'Teste TechTalk'
    assert_difference('Talk.count') do
      post :create, talk: @talk.attributes
    end
    assert_redirected_to root_path
  end
  
  test "deve nao conseguir criar um novo talk" do
    @novo_talk = Talk.new nome: ""
    assert_equal @novo_talk.save, false
  end
end
