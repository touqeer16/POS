<?php

namespace App;

use DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use SoftDeletes;
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    protected $appends = ['image_url'];

    public function products()
    {
        return $this->hasMany('App\Product');
    }

    /**
     * Combines Category and sub-category
     *
     * @param int $business_id
     * @return array
     */
    public static function catAndSubCategories($business_id, $locationID = null)
    {
        $all_categories = Category::leftjoin('category_locations as cl', 'cl.category_id', '=', 'categories.id')
            ->where('business_id', $business_id)
            ->where('cl.location_id', $locationID)
            ->orderBy("short_code", 'asc')
            ->get()
            ->toArray();
        /*  $all_categories = Category::where('business_id', $business_id)
        ->orderBy("short_code", 'asc')
        ->get()
        ->toArray(); */

        if (empty($all_categories)) {
            return [];
        }
        $categories = [];
        $sub_categories = [];

        foreach ($all_categories as $category) {
            if ($category['parent_id'] == 0) {
                $categories[] = $category;
            } else {
                $sub_categories[] = $category;
            }
        }

        $sub_cat_by_parent = [];
        if (!empty($sub_categories)) {
            foreach ($sub_categories as $sub_category) {
                if (empty($sub_cat_by_parent[$sub_category['parent_id']])) {
                    $sub_cat_by_parent[$sub_category['parent_id']] = [];
                }

                $sub_cat_by_parent[$sub_category['parent_id']][] = $sub_category;
            }
        }

        foreach ($categories as $key => $value) {
            if (!empty($sub_cat_by_parent[$value['id']])) {
                $categories[$key]['sub_categories'] = $sub_cat_by_parent[$value['id']];
            }
        }

        return $categories;
    }

    /**
     * Category Dropdown
     *
     * @param int $business_id
     * @param string $type category type
     * @return array
     */
    public static function forDropdown($business_id, $type)
    {
        $categories = Category::where('business_id', $business_id)
            ->where('parent_id', 0)
            ->where('category_type', $type)
            ->select(DB::raw('IF(short_code IS NOT NULL, CONCAT(name, "-", short_code), name) as name'), 'id')
            ->orderBy('name', 'asc')
            ->get();

        $dropdown = $categories->pluck('name', 'id');

        return $dropdown;
    }

    /**
     * Get the products image.
     *
     * @return string
     */
    public function getImageUrlAttribute()
    {

        if (!empty($this->image)) {
            $image_url = asset('/uploads/category_image/' . rawurlencode($this->image));
        } else {
            $image_url = asset('/img/default.png');
        }
        return $image_url;
    }

    /**
     * Get the products image path.
     *
     * @return string
     */
    public function getImagePathAttribute()
    {
        if (!empty($this->image)) {
            $image_path = public_path('uploads') . '/' . config('constants.category_img_path') . '/' . $this->image;
        } else {
            $image_path = null;
        }
        return $image_path;
    }

    public function media()
    {
        return $this->hasOne(\App\Media::class, 'model_id');
    }

    public function sub_categories()
    {
        return $this->hasMany(\App\Category::class, 'parent_id');
    }

    /**
     * Scope a query to only include main categories.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeOnlyParent($query)
    {
        return $query->where('parent_id', 0);
    }
}
