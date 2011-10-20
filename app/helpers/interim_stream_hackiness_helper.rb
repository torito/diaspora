module InterimStreamHackinessHelper
  def commenting_disabled?(post)
    return true unless user_signed_in?
    if defined?(@commenting_disabled)
      @commenting_disabled
    elsif defined?(@stream)
      !@stream.can_comment?(post)
    else 
      false
    end
  end

  def publisher_prefill_text
    if params[:prefill].present?
      params[:prefill]
    elsif defined?(@stream)
      @stream.publisher.prefill
    else
      nil
    end
  end

  def publisher_open
    if defined?(@stream)
      @stream.publisher.open?
    else
      false
    end
  end
end
