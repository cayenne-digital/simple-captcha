class SimpleCaptchaController < ActionController::Metal
  include ActionController::DataStreaming
  include SimpleCaptcha::ImageHelpers

  # GET /simple_captcha
  def show
    unless params[:id].blank?
      send_data(
        generate_simple_captcha_image(params[:id]),
        :type => 'image/jpeg',
        :disposition => 'inline',
        :filename => 'simple_captcha_#{Time.now.to_i}.jpg')
    else
      self.response_body = [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
