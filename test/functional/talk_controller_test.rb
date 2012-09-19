require 'test_helper'

class TalksControllerTest < ActionController::TestCase
  setup do
    @talk = talks(:one)
  end

  test "deve conseguir acessar a index" do
    get :index
    assert_response :success
  end

  test "deve conseguir acessar a rota new" do
    get :new
    assert_response :success
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
  
  test "deve acessar o index e retornar os talks ordenados por data" do
    @talk.data = 10.days.from_now
    @talk.save
    @segundo_talk = talks(:two)
    @segundo_talk.data = 11.days.from_now
    @segundo_talk.save
    get :index
    @numero_talks = css_select ".index-talk"
    assert @numero_talks.length == 2
    assert @talk.nome.in? @numero_talks[0].to_s
    assert @segundo_talk.nome.in? @numero_talks[1].to_s
  end
  
  test "deve acessar o index e nao conter nenhum techtalk" do
    Talk.delete_all
    get :index
    assert_select ".sem-talk"
  end
end
