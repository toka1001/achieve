ready = -> ##ページが読み込まれた時にCoffieScriptを読み込ませる
  $(window).scroll -> ##ページの先頭から読み込んだ高さで処理実施
    element = $('#page-top-btn') ##トップに戻るボタンのHTML要素を呼び出し
    visible = element.is(':visible') ##ボタンが表示されている場合のみの処理とする
    height = $(window).scrollTop() ##何pt読み込んでいるか取得
    if height > 400 ## 400以上の高さか否かで処理分岐
      element.fadeIn() if !visible ##非表示の要素に対する表示時アニメーション
    else
      element.fadeOut() ##表示の要素に対する非表示アニメーション
      $(document).on 'click', '#move-page-top', -> ##move-page-topというdiv要素をクリックした時に動作する
          $('html, body').animate({ scrollTop: 0 }, 'slow') ##アニメーションをしながら、画面TOPまでゆっくり戻る

$(window).scroll -> 
    element = $('#page-blogtop-btn') 
    visible = element.is(':visible') 
    height = $(window).scrollTop() 
    if height > 200 
      element.fadeIn() if !visible 
    else
      element.fadeOut()
      $(document).on 'click', '#move-blogpage-top', -> ##move-blogpage-topというdiv要素をクリックした時に動作する
          $('html, body').animate({ scrollTop: 0 }, 'slow') 
          
$(document).ready(ready) ##ページが読み込まれた時にCoffieScriptを読み込ませる
$(document).on('page:load', ready) ##ページが読み込まれた時にCoffieScriptを読み込ませる