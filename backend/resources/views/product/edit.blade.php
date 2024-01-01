@extends('layouts.app')
@section('title', __('product.edit_product'))

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>@lang('product.edit_product')</h1>
    <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol> -->
</section>

<!-- Main content -->
<section class="content">
{!! Form::open(['url' => action('ProductController@update' , [$product->id] ), 'method' => 'PUT', 'id' => 'product_add_form',
        'class' => 'product_form', 'files' => true ]) !!}
    <input type="hidden" id="product_id" value="{{ $product->id }}">

    @component('components.widget', ['class' => 'box-primary'])
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    {!! Form::label('name', __('product.product_name') . ':*') !!}
                    {!! Form::text('name', $product->name, ['class' => 'form-control', 'required',
                    'placeholder' => __('product.product_name')]); !!}
                </div>
            </div>

            {{--            <div class="col-sm-4 @if(!(session('business.enable_category') && session('business.enable_sub_category'))) hide @endif">--}}
            {{--              <div class="form-group">--}}
            {{--                {!! Form::label('sku', __('product.sku')  . ':*') !!} @show_tooltip(__('tooltip.sku'))--}}
            {{--                {!! Form::text('sku', $product->sku, ['class' => 'form-control',--}}
            {{--                'placeholder' => __('product.sku'), 'required', 'readonly']); !!}--}}
            {{--              </div>--}}
            {{--            </div>--}}

            <div class="col-sm-4">
                <div class="form-group">
                    {!! Form::label('sku', __('product.sku')  . ':*') !!} @show_tooltip(__('tooltip.sku'))
                    {!! Form::text('sku', $product->sku, ['class' => 'form-control',
                    'placeholder' => __('product.sku'), 'required']); !!}
                </div>
                <!-- hide this field and keep the default value -->
                <div class="form-group hide">
                    {!! Form::label('barcode_type', __('product.barcode_type') . ':*') !!}
                    {!! Form::select('barcode_type', $barcode_types, $product->barcode_type, ['placeholder' => __('messages.please_select'), 'class' => ' form-control select2', 'required']); !!}
                </div>
            </div>

            <div class="col-sm-4">
              <div class="form-group">
                {!! Form::label('unit_id', __('product.unit') . ':*') !!}
                <div class="input-group">
                  {!! Form::select('unit_id', $units, $product->unit_id, ['placeholder' => __('messages.please_select'), 'class' => 'form-control select2', 'required']); !!}
                  <span class="input-group-btn">
                    <button type="button" @if(!auth()->user()->can('unit.create')) disabled @endif class="btn btn-default bg-white btn-flat quick_add_unit btn-modal" data-href="{{action('UnitController@create', ['quick_add' => true])}}" title="@lang('unit.add_unit')" data-container=".view_modal"><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
                  </span>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>



            <div class="col-sm-4 @if(!session('business.enable_sub_units')) hide @endif">
              <div class="form-group">
                {!! Form::label('sub_unit_ids', __('lang_v1.related_sub_units') . ':') !!} @show_tooltip(__('lang_v1.sub_units_tooltip'))

                <select name="sub_unit_ids[]" class="form-control select2" multiple id="sub_unit_ids">
                  @foreach($sub_units as $sub_unit_id => $sub_unit_value)
                    <option value="{{$sub_unit_id}}"
                      @if(is_array($product->sub_unit_ids) &&in_array($sub_unit_id, $product->sub_unit_ids))   selected
                      @endif
                    >{{$sub_unit_value['name']}}</option>
                  @endforeach
                </select>
              </div>
            </div>

            <div class="col-sm-4 @if(!session('business.enable_brand')) hide @endif">
              <div class="form-group">
                {!! Form::label('brand_id', __('product.brand') . ':') !!}
                <div class="input-group">
                  {!! Form::select('brand_id', $brands, $product->brand_id, ['placeholder' => __('messages.please_select'), 'class' => 'form-control select2']); !!}
                  <span class="input-group-btn">
                    <button type="button" @if(!auth()->user()->can('brand.create')) disabled @endif class="btn btn-default bg-white btn-flat btn-modal" data-href="{{action('BrandController@create', ['quick_add' => true])}}" title="@lang('brand.add_brand')" data-container=".view_modal"><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
                  </span>
                </div>
              </div>
            </div>



            <div class="clearfix"></div>
            <div class="col-sm-4 @if(!session('business.enable_category')) hide @endif">
              <div class="form-group">
                {!! Form::label('category_id', __('product.category') . ':') !!}
                  {!! Form::select('category_id', $categories, $product->category_id, ['placeholder' => __('messages.please_select'), 'class' => 'form-control select2']); !!}
              </div>
            </div>

            <div class="col-sm-4 @if(!(session('business.enable_category') && session('business.enable_sub_category'))) hide @endif">
              <div class="form-group">
                {!! Form::label('sub_category_id', __('product.sub_category')  . ':') !!}
                  {!! Form::select('sub_category_id', $sub_categories, $product->sub_category_id, ['placeholder' => __('messages.please_select'), 'class' => 'form-control select2']); !!}
              </div>
            </div>

            <div class="col-sm-4">
              <div class="form-group">
                {!! Form::label('product_locations', __('business.business_locations') . ':') !!} @show_tooltip(__('lang_v1.product_location_help'))
                  {!! Form::select('product_locations[]', $business_locations, $product->product_locations->pluck('id'), ['class' => 'form-control select2 Location', 'multiple', 'id' => 'product_locations']); !!}
              </div>
            </div>
            @if(in_array('kitchen',$business->enabled_modules))
                <div class="col-md-4" id="kitchenStations">
                    @php
                        $locationIds = $product->product_locations->pluck('id')->toArray();
                    @endphp
                    @foreach($kitchenStations as $key => $kitchenStation)
                        <div id="kitchenStationsGroup-{{$key}}" @if($product->productKitchenStation->count() > 0) {{(in_array($key, $locationIds)) ? 'style=display:block;' : 'style=display:none;' }} @endif>
                            <label>{{$kitchenStation->first()->location->name}}</label>
                            @php
                                 $ids = $product->productKitchenStation()->pluck('kitchen_station_id')->toArray();
                            @endphp
                            @foreach($kitchenStation as $station)
                                <div class="checkbox">
                                    <label>
                                        {!! Form::radio('kitchen_station['.$key.']', $station->id, (in_array($station->id, $ids)) ? true : false,
                                        [ 'class' => 'input-icheck']); !!} {{ $station->station_name }}
                                    </label>
                                </div>
                            @endforeach
                        </div>
                    @endforeach
                </div>
            @endif
            <div class="clearfix"></div>

            <div class="col-sm-4">
              <div class="form-group">
              <br>
                <label>
                  {!! Form::checkbox('enable_stock', 1, $product->enable_stock, ['class' => 'input-icheck', 'id' => 'enable_stock']); !!} <strong>@lang('product.manage_stock')</strong>
                </label>@show_tooltip(__('tooltip.enable_stock')) <p class="help-block"><i>@lang('product.enable_stock_help')</i></p>
              </div>
            </div>
            <div class="col-sm-4" id="alert_quantity_div" @if(!$product->enable_stock) style="display:none" @endif>
              <div class="form-group">
                {!! Form::label('alert_quantity', __('product.alert_quantity') . ':') !!} @show_tooltip(__('tooltip.alert_quantity'))
                {!! Form::number('alert_quantity', $product->alert_quantity, ['class' => 'form-control',
                'placeholder' => __('product.alert_quantity') , 'min' => '0']); !!}
              </div>
            </div>
            @if(!empty($common_settings['enable_product_warranty']))
            <div class="col-sm-4">
              <div class="form-group">
                {!! Form::label('warranty_id', __('lang_v1.warranty') . ':') !!}
                {!! Form::select('warranty_id', $warranties, $product->warranty_id, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select')]); !!}
              </div>
            </div>
            @endif
            <!-- include module fields -->
            @if(!empty($pos_module_data))
                @foreach($pos_module_data as $key => $value)
                    @if(!empty($value['view_path']))
                        @includeIf($value['view_path'], ['view_data' => $value['view_data']])
                    @endif
                @endforeach
            @endif
            <div class="clearfix"></div>
            <!--  hide this HTML editor -->
            <div class="col-sm-8 hide">
              <div class="form-group">
                {!! Form::label('product_description', __('lang_v1.product_description') . ':') !!}
                  {!! Form::textarea('product_description', $product->product_description, ['class' => 'form-control']); !!}
              </div>
            </div>
            <div class="col-sm-4 product-image">
              <div class="form-group">
                {!! Form::label('image', __('lang_v1.product_image') . ':') !!}
                {!! Form::file('image', ['id' => 'upload_image', 'accept' => 'image/*']); !!}
                <small><p class="help-block">@lang('purchase.max_file_size', ['size' => (config('constants.document_size_limit') / 1000000)]). @lang('lang_v1.aspect_ratio_should_be_1_1') @if(!empty($product->image)) <br> @lang('lang_v1.previous_image_will_be_replaced') @endif</p></small>
              </div>
            </div>

            </div>
    @endcomponent

    @component('components.widget', ['class' => 'box-primary'])
        <div class="row">
        @if(session('business.enable_product_expiry'))

          @if(session('business.expiry_type') == 'add_expiry')
            @php
              $expiry_period = 12;
              $hide = true;
            @endphp
          @else
            @php
              $expiry_period = null;
              $hide = false;
            @endphp
          @endif
          <div class="col-sm-4 @if($hide) hide @endif">
            <div class="form-group">
              <div class="multi-input">
                @php
                  $disabled = false;
                  $disabled_period = false;
                  if( empty($product->expiry_period_type) || empty($product->enable_stock) ){
                    $disabled = true;
                  }
                  if( empty($product->enable_stock) ){
                    $disabled_period = true;
                  }
                @endphp
                  {!! Form::label('expiry_period', __('product.expires_in') . ':') !!}<br>
                  {!! Form::text('expiry_period', @num_format($product->expiry_period), ['class' => 'form-control pull-left input_number',
                    'placeholder' => __('product.expiry_period'), 'style' => 'width:60%;', 'disabled' => $disabled]); !!}
                  {!! Form::select('expiry_period_type', ['months'=>__('product.months'), 'days'=>__('product.days'), '' =>__('product.not_applicable') ], $product->expiry_period_type, ['class' => 'form-control select2 pull-left', 'style' => 'width:40%;', 'id' => 'expiry_period_type', 'disabled' => $disabled_period]); !!}
              </div>
            </div>
          </div>
          @endif
            @if($enableModule->enable_product_description_imei_or_serial_number)
              <div class="col-sm-4">
                <div class="checkbox">
                  <label>
                    {!! Form::checkbox('enable_sr_no', 1, $product->enable_sr_no, ['class' => 'input-icheck']); !!} <strong>@lang('lang_v1.enable_imei_or_sr_no')</strong>
                  </label>
                  @show_tooltip(__('lang_v1.tooltip_sr_no'))
                </div>
              </div>
            @endif
          <div class="col-sm-4">
          <div class="form-group">
            <br>
            <label>
              {!! Form::checkbox('not_for_selling', 1, $product->not_for_selling, ['class' => 'input-icheck']); !!} <strong>@lang('lang_v1.not_for_selling')</strong>
            </label> @show_tooltip(__('lang_v1.tooltip_not_for_selling'))
          </div>
        </div>

        <div class="clearfix"></div>

        <!-- Rack, Row & position number -->
        @if(session('business.enable_racks') || session('business.enable_row') || session('business.enable_position'))
          <div class="col-md-12">
            <h4>@lang('lang_v1.rack_details'):
              @show_tooltip(__('lang_v1.tooltip_rack_details'))
            </h4>
          </div>
          @foreach($business_locations as $id => $location)
            <div class="col-sm-3">
              <div class="form-group">
                {!! Form::label('rack_' . $id,  $location . ':') !!}


                  @if(!empty($rack_details[$id]))
                    @if(session('business.enable_racks'))
                      {!! Form::text('product_racks_update[' . $id . '][rack]', $rack_details[$id]['rack'], ['class' => 'form-control', 'id' => 'rack_' . $id]); !!}
                    @endif

                    @if(session('business.enable_row'))
                      {!! Form::text('product_racks_update[' . $id . '][row]', $rack_details[$id]['row'], ['class' => 'form-control']); !!}
                    @endif

                    @if(session('business.enable_position'))
                      {!! Form::text('product_racks_update[' . $id . '][position]', $rack_details[$id]['position'], ['class' => 'form-control']); !!}
                    @endif
                  @else
                    {!! Form::text('product_racks[' . $id . '][rack]', null, ['class' => 'form-control', 'id' => 'rack_' . $id, 'placeholder' => __('lang_v1.rack')]); !!}

                    {!! Form::text('product_racks[' . $id . '][row]', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.row')]); !!}

                    {!! Form::text('product_racks[' . $id . '][position]', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.position')]); !!}
                  @endif

              </div>
            </div>
          @endforeach
        @endif
        @if($enableModule->enable_weight)
            <div class="col-sm-4">
              <div class="form-group">
                {!! Form::label('weight',  __('lang_v1.weight') . ':') !!}
                {!! Form::text('weight', $product->weight, ['class' => 'form-control', 'placeholder' => __('lang_v1.weight')]); !!}
              </div>
            </div>
        @endif
        <div class="clearfix"></div>
        @php
          $custom_labels = json_decode(session('business.custom_labels'), true);
          $product_custom_field1 = !empty($custom_labels['product']['custom_field_1']) ? $custom_labels['product']['custom_field_1'] : __('lang_v1.product_custom_field1');
          $product_custom_field2 = !empty($custom_labels['product']['custom_field_2']) ? $custom_labels['product']['custom_field_2'] : __('lang_v1.product_custom_field2');
          $product_custom_field3 = !empty($custom_labels['product']['custom_field_3']) ? $custom_labels['product']['custom_field_3'] : __('lang_v1.product_custom_field3');
          $product_custom_field4 = !empty($custom_labels['product']['custom_field_4']) ? $custom_labels['product']['custom_field_4'] : __('lang_v1.product_custom_field4');
        @endphp
        <!--custom fields-->
        <div class="col-sm-3">
          <div class="form-group">
            {!! Form::label('product_custom_field1',  $product_custom_field1 . ':') !!}
            {!! Form::text('product_custom_field1', $product->product_custom_field1, ['class' => 'form-control', 'placeholder' => $product_custom_field1]); !!}
          </div>
        </div>

        <div class="col-sm-3">
          <div class="form-group">
            {!! Form::label('product_custom_field2',  $product_custom_field2 . ':') !!}
            {!! Form::text('product_custom_field2', $product->product_custom_field2, ['class' => 'form-control', 'placeholder' => $product_custom_field2]); !!}
          </div>
        </div>

        <div class="col-sm-3">
          <div class="form-group">
            {!! Form::label('product_custom_field3',  $product_custom_field3 . ':') !!}
            {!! Form::text('product_custom_field3', $product->product_custom_field3, ['class' => 'form-control', 'placeholder' => $product_custom_field3]); !!}
          </div>
        </div>

        <div class="col-sm-3">
          <div class="form-group">
            {!! Form::label('product_custom_field4',  $product_custom_field4 . ':') !!}
            {!! Form::text('product_custom_field4', $product->product_custom_field4, ['class' => 'form-control', 'placeholder' => $product_custom_field4]); !!}
          </div>
        </div>
        <!--custom fields-->
        @include('layouts.partials.module_form_part')
        </div>
    @endcomponent

    @component('components.widget', ['class' => 'box-primary'])
        <div class="row ">
        <div class="col-sm-6">
            <button type="button" class="btn btn-outline-success mx-auto btn-lg" data-toggle="modal" data-target="#addModifiersModal"> @lang('lang_v1.assign_unassign_modifiers') <i class="fas fa-plus"></i></button>
        </div>
        <div class="col-sm-6">
          <p>
            <span> @lang('lang_v1.go_to_modifiers_page')  </span>
            <a href="{{url('modules/modifiers')}}" > @lang('lang_v1.modifiers_page') </a>
          </p>
        </div>
        <div class="col-sm-12">
          <table class="table table-bordered table-striped" id="modifier_table">
          <thead>
            			<tr>
            				<th>@lang( 'restaurant.modifier_sets' )</th>
                     <th>@lang( 'restaurant.modifiers' )</th>

            			</tr>
            		</thead>
          </table>
          </div>
        </div>
         <!--Custom Product Price Modal -->
      @include('product.modifiers.add_modifiers_modal')
    @endcomponent

    @component('components.widget', ['class' => 'box-primary'])
    <div class="row ">
       <div class="col-sm-4">
            <button type="button" class="btn btn-outline-success mx-auto btn-lg" data-toggle="modal" data-target="#addCustomPriceModal"> @lang('lang_v1.add_custom_price') <i class="fas fa-plus"></i></button>
        </div>
        <div class="col-sm-8"></div>

        <div class="col-sm-12">
          <table class="table table-bordered table-striped custom_price_table_class" id="custom_price_table">
          <thead>
            			<tr>
                  <th>@lang( 'business.business_locations' )</th>
            				<th>@lang( 'product.inc_of_tax' )</th>
                     <th>@lang( 'product.exc_of_tax' )</th>
                     <th>@lang( 'product.applicable_tax' )</th>
            			</tr>
            		</thead>
          </table>
        </div>
        </div>
      <!--Custom Product Price Modal -->
      @include('product.partials.add_custom_price_modal')
    @endcomponent




    @component('components.widget', ['class' => 'box-primary'])
        <div class="row ">
          <!-- hide this two field: this will affect default selection, please make VAT the default selection, and tax type Inclusive  .please note that you need to pre-define VAT as a default TAX type, as it is not pre-defined once a new account is created (new business created) -->
            <div class="hide col-sm-4 @if(!session('business.enable_price_tax')) hide @endif">
              <div class="form-group ">
                {!! Form::label('tax', __('product.applicable_tax') . ':') !!}
                  {!! Form::select('tax', $taxes, $product->tax, ['placeholder' => __('messages.please_select'), 'class' => 'form-control select2'], $tax_attributes); !!}
              </div>
            </div>

            <div class="hide col-sm-4 @if(!session('business.enable_price_tax')) hide @endif">
              <div class="form-group  ">
                {!! Form::label('tax_type', __('product.selling_price_tax_type') . ':*') !!}
                  {!! Form::select('tax_type',['inclusive' => __('product.inclusive'), 'exclusive' => __('product.exclusive')], $product->tax_type,
                  ['class' => 'form-control select2', 'required']); !!}
              </div>
            </div>


            <div class="col-sm-4">
              <div class="form-group">
                {!! Form::label('type', __('product.product_type') . ':*') !!} @show_tooltip(__('tooltip.product_type'))
                {!! Form::select('type', $product_types, $product->type, ['class' => 'form-control select2',
                  'required','disabled', 'data-action' => 'edit', 'data-product_id' => $product->id ]); !!}
              </div>
            </div>

            <div class="form-group col-sm-12" id="product_form_part"></div>
            <input type="hidden" id="variation_counter" value="0">
            <input type="hidden" id="default_profit_percent" value="{{ $default_profit_percent }}">
         </div>
    @endcomponent

  <div class="row">
    <input type="hidden" name="submit_type" id="submit_type">
        <div class="col-sm-12">
          <div class="text-center">
            <div class="btn-group">
              @if($selling_price_group_count)
                <button type="submit" value="submit_n_add_selling_prices" class="btn btn-warning submit_product_form">@lang('lang_v1.save_n_add_selling_price_group_prices')</button>
              @endif

              @can('product.opening_stock')
              <button type="submit" @if(empty($product->enable_stock)) disabled="true" @endif id="opening_stock_button"  value="update_n_edit_opening_stock" class="btn bg-purple submit_product_form">@lang('lang_v1.update_n_edit_opening_stock')</button>
              @endif

              <button type="submit" value="save_n_add_another" class="btn bg-maroon submit_product_form">@lang('lang_v1.update_n_add_another')</button>

              <button type="submit" value="submit" class="btn btn-primary submit_product_form">@lang('messages.update')</button>
            </div>
          </div>
        </div>
  </div>
{!! Form::close() !!}
</section>
<!-- /.content -->

<div class="modal fade" id="view_edit_product_price_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
</div>


@endsection

@section('javascript')
  <script src="{{ asset('js/product.js?v=' . $asset_v) }}"></script>
  <script type="text/javascript">
    $(document).ready( function(){
      __page_leave_confirmation('#product_add_form');
    });

  // $(function () {
        var product_id = $('#product_id').val();
        $('#save_modifiers').on('click', function () {
              var ids = $('#modifiers_ids').val();

                $.ajax({
                    url: '/products/add_modifiers/'+product_id,
                    data: {
                      modifiers_ids: ids,
                    },
                    dataType : 'json',
                    success: function(result){
                        if(result.success == true){
                            $('#addModifiersModal').modal('hide');
                            toastr.success(result.msg);
                            modifier_table.ajax.reload();
                            //location.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    }
                });
        });

        $('#save_custom_price').on('click', function () {
              var custom_product_locations = $('#custom_product_locations').val();
              var add_single_dsp_inc_tax = $('#add_single_dsp_inc_tax').val();
              var add_single_dpp = $('#add_single_dpp').val();
              var add_applicable_tax = $('#add_applicable_tax').val();

                $.ajax({
                    url: '/products/add_product_custom_price/'+product_id,
                    data: {
                      custom_product_locations: custom_product_locations,
                      add_single_dsp_inc_tax: add_single_dsp_inc_tax,
                      add_single_dpp: add_single_dpp,
                      add_applicable_tax: add_applicable_tax,
                    },
                    dataType : 'json',
                    success: function(result){
                        if(result.success == true){
                          $("#addCustomPriceModal").find(':input').val('');
                          $('#addCustomPriceModal').modal('hide');
                          $("#addCustomPriceModal").find("select").val('').end(); // Clear dropdown content
                          $("ul.select2-selection__rendered").empty();   // Clear li content
                          toastr.success(result.msg);
                          custom_price_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    }
                });
        });








      //Brands table
      var modifier_table = $('#modifier_table').DataTable({
              searching: false,
              paging: false,
              info: false,
              processing: true,
              serverSide: true,
              ajax: '/products/loadModifiersTable/'+product_id,
              columnDefs: [ {
                  "targets": [1],
                  "orderable": false,
                  "searchable": false
              } ],
              columns: [
                  { data: 'name', name: 'name'  },
                  { data: 'variations', name: 'variations'},

              ],
      });

      var custom_price_table = $('#custom_price_table').DataTable({
              searching: false,
              paging: false,
              info: false,
              processing: true,
              serverSide: true,
              ajax: '/products/loadCustomProductPriceTable/'+product_id,
              columnDefs: [ {
                  "targets": [1],
                  "orderable": false,
                  "searchable": false
              } ],
              columns: [

                  { data: 'business_name', name: 'business_name'  },
                  { data: 'custom_price', name: 'custom_price'  },
                  { data: 'custom_price_exc_tax', name: 'custom_price_exc_tax'},
                  { data: 'custom_price_applicable_tax', name: 'custom_price_applicable_tax'},
                  // { data: 'action', name: 'action'},


              ],
      });



      $('#single_dpp_inc_tax').on('input', function() {
        $('.span').text(this.value)
      })
       $('#modifier_table_wrapper').find('.dt-buttons').hide();
       $('#custom_price_table_wrapper').find('.dt-buttons').hide();


  // });


  function myFunction(product_id,business_id){

        $.ajax({
            url: '/products/editCustomProductPrice/'+product_id + '/'  + business_id ,
            dataType : 'html',
            success: function(result){

                     toastr.success(result.msg);
                     $('#view_edit_product_price_modal').html(result) .modal('show');
                     //edit_custom_product_price_type_form();
                    //__currency_convert_recursively($('#view_edit_product_price_modal'));

            }
        });

  }

  function edit_custom_product_price_type_form() {

      //Disable Stock management & Woocommmerce sync if type combo
      if ($('#type').val() == 'combo') {
          $('#enable_stock').iCheck('uncheck');
          $('input[name="woocommerce_disable_sync"]').iCheck('check');
      }
      // product image hide
      if ($('#type').val() == 'variable') {
          $('.product-image').hide();
      } else {
          $('.product-image').show();
      }

      var action = $('#type').attr('data-action');
      var product_id = $('#type').attr('data-product_id');
      $.ajax({
          method: 'POST',
          url: '/products/custom_product_price_form_part',
          dataType: 'html',
          data: { type: $('#type').val(), product_id: product_id, action: action },
          success: function (result) {
              if (result) {
                  $('#edit_custom_product_price_form_part').html(result);
                  toggle_dsp_input();
              }
          },
      });
}

$(document).on('click', '#save_edit_custom_price', function (e) {

      var edit_single_dsp_inc_tax = $('#edit_single_dsp_inc_tax').val();
      var edit_single_dpp = $('#edit_single_dpp').val();
      var edit_applicable_tax = $('#edit_applicable_tax').val();
      var edit_product_id = $('#edit_product_id').val();
      var edit_business_id = $('#edit_business_id').val();

        $.ajax({
            url: '/products/edit_product_custom_price/'+edit_product_id + '/' + edit_business_id ,
            data: {
              edit_single_dsp_inc_tax: edit_single_dsp_inc_tax,
              edit_single_dpp: edit_single_dpp,
              edit_applicable_tax: edit_applicable_tax,

            },
            dataType : 'json',
            success: function(result){
                if(result.success == true){
                    $('#view_edit_product_price_modal').modal('hide');
                    toastr.success(result.msg);
                    custom_price_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            }
        });
});

$(document).on('change', 'input#edit_single_dsp_inc_tax', function (e) {
        var tax_rate = $('select#tax')
            .find(':selected')
            .data('rate');
        tax_rate = tax_rate == undefined ? 0 : tax_rate;
        var selling_price_inc_tax = __read_number($('input#edit_single_dsp_inc_tax'));
        var selling_price = __get_principle(selling_price_inc_tax, tax_rate);
        var tax_applied = (selling_price_inc_tax - selling_price);
        __write_number($('input#edit_single_dpp'), selling_price);
        __write_number($('input#edit_single_dsp'), selling_price);
        __write_number($('input#edit_applicable_tax'), tax_applied);
        __write_number($('input#edit_single_dpp_inc_tax'), selling_price_inc_tax);
});

$(document).on('change', 'input#add_single_dsp_inc_tax', function (e) {
        var tax_rate = $('select#tax')
            .find(':selected')
            .data('rate');
        tax_rate = tax_rate == undefined ? 0 : tax_rate;
        var selling_price_inc_tax = __read_number($('input#add_single_dsp_inc_tax'));
        var selling_price = __get_principle(selling_price_inc_tax, tax_rate);
        var tax_applied = (selling_price_inc_tax - selling_price);
        __write_number($('input#add_single_dpp'), selling_price);
        __write_number($('input#add_single_dsp'), selling_price);
        __write_number($('input#add_applicable_tax'), tax_applied);
        __write_number($('input#add_single_dpp_inc_tax'), selling_price_inc_tax);
    });


    $(document).on('click', 'a.delete-product-custom-price', function(e){
                e.preventDefault();
                swal({
                  title: LANG.sure,
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        var href = $(this).attr('href');
                        $.ajax({
                            method: "get",
                            url: href,
                            dataType: "json",
                            success: function(result){
                                if(result.success == true){
                                  $('#view_edit_product_price_modal').modal('hide');
                                    toastr.success(result.msg);
                                    custom_price_table.ajax.reload();
                                } else {
                                    toastr.error(result.msg);
                                }
                            }
                        });
                    }
                });
            });

</script>
@endsection
