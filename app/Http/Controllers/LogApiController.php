<?php

namespace App\Http\Controllers;

use App\Models\Device;
use App\Models\LogApi;
use App\Models\VisitorCounting;
use Carbon\Carbon;
use Illuminate\Http\Request;

class LogApiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {


        try {
            $headers = $request->headers->all() ?? 'no header';
            $body = $request->all() ?? 'no body';
            $files = $request->file() ?? 'no file';

            if ($files != null) {
                foreach ($files as $inputName => $file) {

                    $files['originalName'] = $file->getClientOriginalName();
                    $files['mimeType'] = $file->getClientMimeType();

                }
            }

            $log = new LogApi();
            $log->header = json_encode($headers);
            $log->body = json_encode($body);
            $log->files = json_encode($files);
            $log->save();

        } catch (\Throwable $th) {

            return response()->json(['error' => 'Failed to save'], 500);
        } finally {
            try {
                $this->dbPrimary($request);
            } catch (\Throwable $th) {
                //throw $th;
            }
            try {
                $this->dbSecondary($request);
            } catch (\Throwable $th) {
                //throw $th;
            }
            try {
                $this->dbTertiary($request);
            } catch (\Throwable $th) {
                //throw $th;
            }



        }

        return response()->json(['message' => 'Saved successfully'], 200);
    }


    public function dbPrimary($request){

         $jsonData = json_decode($request->input('json'), true);

            $visitorCounting = new VisitorCounting();

            // Menyimpan data dari Metrics
            $visitorCounting->device_name = $jsonData['Metrics']['@Devicename'] ?? null;
            $visitorCounting->device_id_camera = $jsonData['Metrics']['@DeviceId'] ?? null;

            // Menyimpan data dari Properties
            $properties = $jsonData['Metrics']['Properties'] ?? null;

            if ($properties !== null) {
                $data = Device::where('serial', $properties['SerialNumber'])->first();
                $visitorCounting->mac_address = $properties['MacAddress'] ?? null;
                $visitorCounting->ip_address = $properties['IpAddress'] ?? null;
                $visitorCounting->host_name = $properties['HostName'] ?? null;
                $visitorCounting->time_zone = $properties['TimeZone'] ?? null;
                $visitorCounting->serial_number = $properties['SerialNumber'] ?? null;
                $visitorCounting->hw_platform = $properties['HwPlatform'] ?? null;

                if (isset($data)) {

                    $visitorCounting->device_id = $data->id;
                    $visitorCounting->mall_id = $data->mall_id;
                    $visitorCounting->category_location_id = $data->category_location_id;
                    $visitorCounting->location_id = $data->location_id;
                    $visitorCounting->location_id = $data->location_id;
                } else {
                    return response()->json(['message' => 'No Serial Number'], 404);
                }
            } else {
                return response()->json(['message' => 'No Serial Number'], 404);
            }

            $visitorCounting->date = $jsonData['Metrics']['ReportData']['Report']['@Date'] ?? null;
            // Menyimpan data dari ReportData
            if (count($jsonData['Metrics']['ReportData']['Report']['Object']) > 2) {
                $reportData = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['Count'] ?? null;
                $reportDataChildren = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['Count'] ?? null;
                $reportDataService = $jsonData['Metrics']['ReportData']['Report']['Object'][2]['Service'] ?? null;
                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportData !== null) {
                    $visitorCounting->object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['@Id']; // pikir nanti
                    foreach ($reportData as $count) {
                        $visitorCounting->start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->enters = $count['@Enters'] ?? null;
                        $visitorCounting->exits = $count['@Exits'] ?? null;
                        $visitorCounting->count_status = $count['@Status'] ?? null;
                        // $visitorCounting->kids = $count['@kids'] ?? null;

                        if ($visitorCounting->start_time !== null && $visitorCounting->end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataChildren !== null) {
                    $visitorCounting->children_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id']; // pikir nanti
                    foreach ($reportDataChildren as $count) {
                        $visitorCounting->children_start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->children_end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->children_enters = $count['@Enters'] ?? null;
                        $visitorCounting->children_exits = $count['@Exits'] ?? null;
                        $visitorCounting->children_status = $count['@Status'] ?? null;
                        // $visitorCounting->children_kids = $count['@kids'] ?? null;

                        if ($visitorCounting->children_start_time !== null && $visitorCounting->children_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->children_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->children_end_time;
                            $visitorCounting->children_start_datetime = $startTime;
                            $visitorCounting->children_end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataService !== null) {
                    $visitorCounting->service_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id'];

                    foreach ($reportDataService as $service) {
                        $visitorCounting->service_start_time = $service['@StartTime'] ?? null;
                        $visitorCounting->service_end_time = $service['@EndTime'] ?? null;
                        $visitorCounting->seconds_occupied = $service['@SecondsOccupied'] ?? null;
                        $visitorCounting->total_seconds_occupied = $service['@TotalSecondsOccupied'] ?? null;
                        $visitorCounting->service_number_served = $service['@NumberServed'] ?? null;
                        $visitorCounting->service_status = $service['@Status'] ?? null;

                        if ($visitorCounting->service_start_time !== null && $visitorCounting->service_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->service_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->service_end_time;
                            $visitorCounting->service_start_datetime = $startTime;
                            $visitorCounting->service_end_datetime = $endTime;
                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();
                    }
                }
            } else {
                $reportData = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['Count'] ?? null;
                $reportDataService = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['Service'] ?? null;
                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportData !== null) {
                    $visitorCounting->object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['@Id']; // pikir nanti
                    foreach ($reportData as $count) {
                        $visitorCounting->start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->enters = $count['@Enters'] ?? null;
                        $visitorCounting->exits = $count['@Exits'] ?? null;
                        $visitorCounting->count_status = $count['@Status'] ?? null;
                        // $visitorCounting->kids = $count['@kids'] ?? null;

                        if ($visitorCounting->start_time !== null && $visitorCounting->end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataService !== null) {
                    $visitorCounting->service_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id'];

                    foreach ($reportDataService as $service) {
                        $visitorCounting->service_start_time = $service['@StartTime'] ?? null;
                        $visitorCounting->service_end_time = $service['@EndTime'] ?? null;
                        $visitorCounting->seconds_occupied = $service['@SecondsOccupied'] ?? null;
                        $visitorCounting->total_seconds_occupied = $service['@TotalSecondsOccupied'] ?? null;
                        $visitorCounting->service_number_served = $service['@NumberServed'] ?? null;
                        $visitorCounting->service_status = $service['@Status'] ?? null;

                        if ($visitorCounting->service_start_time !== null && $visitorCounting->service_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->service_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->service_end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;
                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();
                    }
                }
            }

    }
    public function dbSecondary($request){

         $jsonData = json_decode($request->input('json'), true);

            $visitorCounting = new VisitorCounting();
            $visitorCounting->setConnection('secondary_mysql');
            // Menyimpan data dari Metrics
            $visitorCounting->device_name = $jsonData['Metrics']['@Devicename'] ?? null;
            $visitorCounting->device_id_camera = $jsonData['Metrics']['@DeviceId'] ?? null;

            // Menyimpan data dari Properties
            $properties = $jsonData['Metrics']['Properties'] ?? null;

            if ($properties !== null) {
                $data = Device::where('serial', $properties['SerialNumber'])->first();
                $visitorCounting->mac_address = $properties['MacAddress'] ?? null;
                $visitorCounting->ip_address = $properties['IpAddress'] ?? null;
                $visitorCounting->host_name = $properties['HostName'] ?? null;
                $visitorCounting->time_zone = $properties['TimeZone'] ?? null;
                $visitorCounting->serial_number = $properties['SerialNumber'] ?? null;
                $visitorCounting->hw_platform = $properties['HwPlatform'] ?? null;

                if (isset($data)) {

                    $visitorCounting->device_id = $data->id;
                    $visitorCounting->mall_id = $data->mall_id;
                    $visitorCounting->category_location_id = $data->category_location_id;
                    $visitorCounting->location_id = $data->location_id;
                    $visitorCounting->location_id = $data->location_id;
                } else {
                    return response()->json(['message' => 'No Serial Number'], 404);
                }
            } else {
                return response()->json(['message' => 'No Serial Number'], 404);
            }

            $visitorCounting->date = $jsonData['Metrics']['ReportData']['Report']['@Date'] ?? null;
            // Menyimpan data dari ReportData
            if (count($jsonData['Metrics']['ReportData']['Report']['Object']) > 2) {
                $reportData = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['Count'] ?? null;
                $reportDataChildren = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['Count'] ?? null;
                $reportDataService = $jsonData['Metrics']['ReportData']['Report']['Object'][2]['Service'] ?? null;
                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportData !== null) {
                    $visitorCounting->object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['@Id']; // pikir nanti
                    foreach ($reportData as $count) {
                        $visitorCounting->start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->enters = $count['@Enters'] ?? null;
                        $visitorCounting->exits = $count['@Exits'] ?? null;
                        $visitorCounting->count_status = $count['@Status'] ?? null;
                        // $visitorCounting->kids = $count['@kids'] ?? null;

                        if ($visitorCounting->start_time !== null && $visitorCounting->end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataChildren !== null) {
                    $visitorCounting->children_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id']; // pikir nanti
                    foreach ($reportDataChildren as $count) {
                        $visitorCounting->children_start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->children_end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->children_enters = $count['@Enters'] ?? null;
                        $visitorCounting->children_exits = $count['@Exits'] ?? null;
                        $visitorCounting->children_status = $count['@Status'] ?? null;
                        // $visitorCounting->children_kids = $count['@kids'] ?? null;

                        if ($visitorCounting->children_start_time !== null && $visitorCounting->children_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->children_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->children_end_time;
                            $visitorCounting->children_start_datetime = $startTime;
                            $visitorCounting->children_end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataService !== null) {
                    $visitorCounting->service_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id'];

                    foreach ($reportDataService as $service) {
                        $visitorCounting->service_start_time = $service['@StartTime'] ?? null;
                        $visitorCounting->service_end_time = $service['@EndTime'] ?? null;
                        $visitorCounting->seconds_occupied = $service['@SecondsOccupied'] ?? null;
                        $visitorCounting->total_seconds_occupied = $service['@TotalSecondsOccupied'] ?? null;
                        $visitorCounting->service_number_served = $service['@NumberServed'] ?? null;
                        $visitorCounting->service_status = $service['@Status'] ?? null;

                        if ($visitorCounting->service_start_time !== null && $visitorCounting->service_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->service_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->service_end_time;
                            $visitorCounting->service_start_datetime = $startTime;
                            $visitorCounting->service_end_datetime = $endTime;
                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();
                    }
                }
            } else {
                $reportData = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['Count'] ?? null;
                $reportDataService = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['Service'] ?? null;
                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportData !== null) {
                    $visitorCounting->object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['@Id']; // pikir nanti
                    foreach ($reportData as $count) {
                        $visitorCounting->start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->enters = $count['@Enters'] ?? null;
                        $visitorCounting->exits = $count['@Exits'] ?? null;
                        $visitorCounting->count_status = $count['@Status'] ?? null;
                        // $visitorCounting->kids = $count['@kids'] ?? null;

                        if ($visitorCounting->start_time !== null && $visitorCounting->end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataService !== null) {
                    $visitorCounting->service_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id'];

                    foreach ($reportDataService as $service) {
                        $visitorCounting->service_start_time = $service['@StartTime'] ?? null;
                        $visitorCounting->service_end_time = $service['@EndTime'] ?? null;
                        $visitorCounting->seconds_occupied = $service['@SecondsOccupied'] ?? null;
                        $visitorCounting->total_seconds_occupied = $service['@TotalSecondsOccupied'] ?? null;
                        $visitorCounting->service_number_served = $service['@NumberServed'] ?? null;
                        $visitorCounting->service_status = $service['@Status'] ?? null;

                        if ($visitorCounting->service_start_time !== null && $visitorCounting->service_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->service_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->service_end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;
                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();
                    }
                }
            }

    }
    public function dbTertiary($request){

         $jsonData = json_decode($request->input('json'), true);

            $visitorCounting = new VisitorCounting();
            $visitorCounting->setConnection('tertiary_mysql');
            // Menyimpan data dari Metrics
            $visitorCounting->device_name = $jsonData['Metrics']['@Devicename'] ?? null;
            $visitorCounting->device_id_camera = $jsonData['Metrics']['@DeviceId'] ?? null;

            // Menyimpan data dari Properties
            $properties = $jsonData['Metrics']['Properties'] ?? null;

            if ($properties !== null) {
                $data = Device::where('serial', $properties['SerialNumber'])->first();
                $visitorCounting->mac_address = $properties['MacAddress'] ?? null;
                $visitorCounting->ip_address = $properties['IpAddress'] ?? null;
                $visitorCounting->host_name = $properties['HostName'] ?? null;
                $visitorCounting->time_zone = $properties['TimeZone'] ?? null;
                $visitorCounting->serial_number = $properties['SerialNumber'] ?? null;
                $visitorCounting->hw_platform = $properties['HwPlatform'] ?? null;

                if (isset($data)) {

                    $visitorCounting->device_id = $data->id;
                    $visitorCounting->mall_id = $data->mall_id;
                    $visitorCounting->category_location_id = $data->category_location_id;
                    $visitorCounting->location_id = $data->location_id;
                    $visitorCounting->location_id = $data->location_id;
                } else {
                    return response()->json(['message' => 'No Serial Number'], 404);
                }
            } else {
                return response()->json(['message' => 'No Serial Number'], 404);
            }

            $visitorCounting->date = $jsonData['Metrics']['ReportData']['Report']['@Date'] ?? null;
            // Menyimpan data dari ReportData
            if (count($jsonData['Metrics']['ReportData']['Report']['Object']) > 2) {
                $reportData = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['Count'] ?? null;
                $reportDataChildren = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['Count'] ?? null;
                $reportDataService = $jsonData['Metrics']['ReportData']['Report']['Object'][2]['Service'] ?? null;
                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportData !== null) {
                    $visitorCounting->object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['@Id']; // pikir nanti
                    foreach ($reportData as $count) {
                        $visitorCounting->start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->enters = $count['@Enters'] ?? null;
                        $visitorCounting->exits = $count['@Exits'] ?? null;
                        $visitorCounting->count_status = $count['@Status'] ?? null;
                        // $visitorCounting->kids = $count['@kids'] ?? null;

                        if ($visitorCounting->start_time !== null && $visitorCounting->end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataChildren !== null) {
                    $visitorCounting->children_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id']; // pikir nanti
                    foreach ($reportDataChildren as $count) {
                        $visitorCounting->children_start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->children_end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->children_enters = $count['@Enters'] ?? null;
                        $visitorCounting->children_exits = $count['@Exits'] ?? null;
                        $visitorCounting->children_status = $count['@Status'] ?? null;
                        // $visitorCounting->children_kids = $count['@kids'] ?? null;

                        if ($visitorCounting->children_start_time !== null && $visitorCounting->children_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->children_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->children_end_time;
                            $visitorCounting->children_start_datetime = $startTime;
                            $visitorCounting->children_end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataService !== null) {
                    $visitorCounting->service_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id'];

                    foreach ($reportDataService as $service) {
                        $visitorCounting->service_start_time = $service['@StartTime'] ?? null;
                        $visitorCounting->service_end_time = $service['@EndTime'] ?? null;
                        $visitorCounting->seconds_occupied = $service['@SecondsOccupied'] ?? null;
                        $visitorCounting->total_seconds_occupied = $service['@TotalSecondsOccupied'] ?? null;
                        $visitorCounting->service_number_served = $service['@NumberServed'] ?? null;
                        $visitorCounting->service_status = $service['@Status'] ?? null;

                        if ($visitorCounting->service_start_time !== null && $visitorCounting->service_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->service_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->service_end_time;
                            $visitorCounting->service_start_datetime = $startTime;
                            $visitorCounting->service_end_datetime = $endTime;
                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();
                    }
                }
            } else {
                $reportData = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['Count'] ?? null;
                $reportDataService = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['Service'] ?? null;
                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportData !== null) {
                    $visitorCounting->object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][0]['@Id']; // pikir nanti
                    foreach ($reportData as $count) {
                        $visitorCounting->start_time = $count['@StartTime'] ?? null;
                        $visitorCounting->end_time = $count['@EndTime'] ?? null;
                        $visitorCounting->enters = $count['@Enters'] ?? null;
                        $visitorCounting->exits = $count['@Exits'] ?? null;
                        $visitorCounting->count_status = $count['@Status'] ?? null;
                        // $visitorCounting->kids = $count['@kids'] ?? null;

                        if ($visitorCounting->start_time !== null && $visitorCounting->end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;

                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();

                    }
                }

                // Iterasi melalui setiap entri "Count" dan menyimpan datanya
                if ($reportDataService !== null) {
                    $visitorCounting->service_object_id = $jsonData['Metrics']['ReportData']['Report']['Object'][1]['@Id'];

                    foreach ($reportDataService as $service) {
                        $visitorCounting->service_start_time = $service['@StartTime'] ?? null;
                        $visitorCounting->service_end_time = $service['@EndTime'] ?? null;
                        $visitorCounting->seconds_occupied = $service['@SecondsOccupied'] ?? null;
                        $visitorCounting->total_seconds_occupied = $service['@TotalSecondsOccupied'] ?? null;
                        $visitorCounting->service_number_served = $service['@NumberServed'] ?? null;
                        $visitorCounting->service_status = $service['@Status'] ?? null;

                        if ($visitorCounting->service_start_time !== null && $visitorCounting->service_end_time !== null) {
                            $startTime = $visitorCounting->date . ' ' . $visitorCounting->service_start_time;
                            $endTime = $visitorCounting->date . ' ' . $visitorCounting->service_end_time;
                            $visitorCounting->start_datetime = $startTime;
                            $visitorCounting->end_datetime = $endTime;
                        }
                        // Simpan ke dalam database
                        $visitorCounting->save();
                    }
                }
            }

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $inputRange = $request->input('datetimes', ''); // Assuming the input is in the 'datetimes' parameter

        if (!empty($inputRange)) {
            // Split the input range into start and end date strings
            list($startDateString, $endDateString) = explode(' - ', $inputRange);

            // Convert date strings to Carbon objects
            $start_date = Carbon::parse($startDateString)->startOfDay();
            $end_date = Carbon::parse($endDateString)->endOfDay();
        } else {
            // If input is not provided, use default values
            $start_date = Carbon::now()->startOfDay();
            $end_date = Carbon::now()->endOfDay();
        }

        // Format the start and end dates for database queries
        $start_date_str = $start_date->toDateTimeString();
        $end_date_str = $end_date->toDateTimeString();

        $logs = LogApi::whereBetween('created_at', [$start_date_str, $end_date_str])
            ->when(isset($_GET["search"]), function ($query) {
                $searchTerm = $_GET["search"];
                if ($_GET["search"] != null) {
                    $query->orWhere('header', 'LIKE', "%{$searchTerm}%")
                        ->orWhere('body', 'LIKE', "%{$searchTerm}%")
                        ->orWhere('files', 'LIKE', "%{$searchTerm}%");
                }
            })
            ->orderby('created_at', 'desc')
            ->paginate(10);

        return view('blade.log', compact('logs'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(LogApi $logApi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(LogApi $logApi)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, LogApi $logApi)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(LogApi $logApi)
    {
        //
    }
}
