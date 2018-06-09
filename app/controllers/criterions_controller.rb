class CriterionsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @criterions = Criterion.new
  end

  def create
    if user_signed_in?
      @criterion = Criterion.new
      @criterion.grease = params[:grease]
      @criterion.carbohydrates = params[:carbohydrates]
      @criterion.proteins = params[:proteins]
      @criterion.calories = params[:calories]
      @criterion = current_user
      if @criterion.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def update
  end

  # def maker_order
  #   @ans = []
  #   @categories = Category.all
  #   @elem = []
  #   @rez_weight = 0
  #   @rez_price = 0
  #   @rez_array = []
  #   @max_weight
  #   @ans = []
  #
  #
  #     for i in 0..@categories[0].products.length
  #       @j = 0
  #       @elem[@j] = @categories[j].products[i]
  #       @j += 1
  #       next_elem(@j)
  #     end
  #
  #   def next_elem(j)
  #       if j == @categories.length
  #         find_ans(@categories.length, @max_weight)
  #         if max_weight-rez_weight > @max_weight - new-weight
  #             @rez_weight= @new_weight
  #             @rez_price = @new_price
  #             @rez_array = @ans
  #           elsif max_price < new_price
  #             @rez_weight= @new_weight
  #             @rez_price = @new_price
  #             @rez_array = @ans
  #         end
  #         return
  #       else
  #         for k in 0..@categories[j].products.length
  #           @elem[j] = @categories[j].products[k]
  #           j += 1
  #           next_elem(j)
  #         end
  #     end
  #   end
  #
  #
  #   def find_ans(elem_length, max_value)
  #       @new_price = 0
  #       @new_weight = 0
  #       if find_max(elem_length, max_value) == 0
  #           return
  #       end
  #       if find_max(elem_length - 1, max_value) == find_max(elem_length, max_value)
  #           find_ans(elem_length - 1, max_value)
  #       else
  #           find_ans(elem_length - 1, max_value - @elem[elem_length])
  #           @ans.push(elem_length)
  #           @new_price += @ans[elem_length].price
  #           @new_weight += @ans[elem_length].weight
  #       end
  #    end
  #
  #     def find_max(elem_length, weight)
  #       matrix = Array.new(@categories.length) { Array.new(@categories.length) }
  #       @max = 0
  #           for chang_weight_from_zero_to_w  in 0..weight
  #               matrix[0][chang_weight_from_zero_to_w] = 0
  #                 for count_elements in 0..elem_length
  #                     matrix[count_elements][0] = 0
  #                       for k_count_elem in 1..elem_length
  #                               for s in 1..weight
  #                                       if s >= elem[k_count_elem]
  #                                           @max =  matrix[k_count_elem][s] =
  #                                               Math.max(matrix[k_count_elem - 1][s], matrix[k_count_elem - 1][s - @elem[k_count_elem]] +
  #                                                   @elem[k_count_elem].price)
  #                                       }
  #                                       else
  #
  #                                           @max = matrix[k_count_elem][s] = matrix[k_count_elem - 1][s]
  #                                           return @max
  #                                       end
  #                               end
  #                       end
  #                 end
  #           end
  #     end
  #   end

  def destroy
  end

  def criyterion_params
    params.require(:criterion).permit(:proteins, :carbohydrates, :grease, :calories)
  end


end
