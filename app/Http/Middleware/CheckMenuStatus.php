<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\Menu;

class CheckMenuStatus
{
    public function handle(Request $request, Closure $next)
    {

        $menu = Menu::where('route', $request->segment(1))->first(); // Ambil nama menu dari URL

        if ($menu && !$menu->status) {
            // Menu tidak aktif, arahkan pengguna atau berikan respons yang sesuai
            abort(404);
        }

        return $next($request);
    }
}
