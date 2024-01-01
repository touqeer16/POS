<div class="modal-dialog" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => action('TaxonomyController@addCategoryModifiers', [$category_id]), 'method' => 'POST', 'id' => 'assign_unassign_form', 'enctype' => 'multipart/form-data' ]) !!}
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLongTitle">  @lang('lang_v1.add_modifiers') </h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            {!! Form::hidden('categoryID', $category_id, ['class' => 'form-control']); !!}
            {!! Form::select('modifiers_ids[]', $modifiers_dropdown,  $modifier_products_ids  , ['class' => 'form-control select2 ', 'multiple', 'id' => 'modifiers_ids']); !!}
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">@lang('lang_v1.save_changes')</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
            </div>
          </div>
        {!! Form::close() !!}
      </div>
  </div>
<script src="{{ asset('js/app.js?v=' . $asset_v) }}"></script>
