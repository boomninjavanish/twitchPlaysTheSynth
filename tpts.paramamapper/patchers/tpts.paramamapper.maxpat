{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 10,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 440.0, 205.0, 1505.0, 1083.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 1,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-66",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "tpts.bpatcher.pmappers.maxpat",
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 392.0, 446.0, 134.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.749999165534973, 59.125000178813934, 437.0, 132.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"id" : "obj-54",
					"lcdcolor" : [ 0.850980392156863, 0.0, 0.0, 1.0 ],
					"maxclass" : "live.tab",
					"mode" : 1,
					"multiline" : 0,
					"num_lines_patching" : 1,
					"num_lines_presentation" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 602.0, 322.5, 141.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.749999165534973, 32.0, 118.0, 18.125000178813934 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "parameters", "values" ],
							"parameter_longname" : "live.tab",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.tab",
							"parameter_type" : 2,
							"parameter_unitstyle" : 9
						}

					}
,
					"varname" : "live.tab"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1304.0, 117.0, 19.0, 18.0 ],
					"text" : "L",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1304.0, 36.0, 19.0, 18.0 ],
					"text" : "L",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1377.0, 37.0, 19.0, 18.0 ],
					"text" : "R",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1376.0, 117.0, 19.0, 18.0 ],
					"text" : "R",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1367.0, 78.0, 126.0, 18.0 ],
					"text" : "Build your Audio Effect here",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1315.0, 138.0, 63.0, 18.0 ],
					"text" : "Audio to Live",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1310.0, 18.0, 74.0, 18.0 ],
					"text" : "Audio from Live",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 1320.0, 116.0, 53.0, 20.0 ],
					"text" : "plugout~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 1320.0, 36.0, 53.0, 20.0 ],
					"text" : "plugin~"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-48",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 426.0, 106.5, 203.0, 51.0 ],
					"text" : "get the current tempo so that the mapper may change over the correct amount of millis"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 333.0, 121.0, 91.0, 22.0 ],
					"text" : "r ---bangTempo"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 228.0, 277.0, 93.0, 22.0 ],
					"text" : "s ---bangTempo"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 160.5, 234.0, 86.5, 22.0 ],
					"text" : "t l b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 333.0, 190.0, 146.0, 22.0 ],
					"text" : "dunlap.ableton.tempoOps"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 493.0, 234.0, 22.0, 22.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-37",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 687.0, 175.5, 154.0, 51.0 ],
					"text" : "receive bangs to output all mapper names to twitch bot"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 493.0, 190.0, 187.0, 22.0 ],
					"text" : "route /tpts/paramamapper/remind"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 160.5, 190.0, 147.0, 22.0 ],
					"text" : "route /tpts/paramamapper"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.5, 121.0, 97.0, 22.0 ],
					"text" : "udpreceive 9009"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.890196078431372, 0.011764705882353, 0.011764705882353, 0.5 ],
					"activetextoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 33.0, 322.5, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 413.749999165534973, 15.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_longname" : "live.text",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text",
							"parameter_type" : 2
						}

					}
,
					"text" : "Bypass",
					"texton" : "Bypass",
					"varname" : "live.text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 564.0, 131.0, 22.0 ],
					"text" : "prepend /tpts/twitchBot"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.0, 611.0, 138.0, 22.0 ],
					"text" : "udpsend 127.0.0.1 8008"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 2,
					"fontname" : "Helvetica Bold",
					"fontsize" : 10.0,
					"id" : "obj-39",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 58.0, 8.0, 137.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 78.749999165534973, 9.5, 136.0, 16.0 ],
					"text" : "Parameter Mapper",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Helvetica Bold",
					"fontsize" : 20.0,
					"id" : "obj-32",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 3.0, 56.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.749999165534973, 4.0, 70.0, 26.0 ],
					"text" : "!tpts",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.157, 0.157, 0.157, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.851, 0.0, 0.0, 1.0 ],
					"id" : "obj-67",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 31.0, 33.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.749999165534973, 48.0, 449.0, 147.125000178813934 ],
					"proportion" : 0.5,
					"rounded" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"midpoints" : [ 42.5, 589.0, 42.5, 589.0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 170.0, 144.0, 170.0, 144.0 ],
					"order" : 1,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 170.0, 177.0, 502.5, 177.0 ],
					"order" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 3 ],
					"midpoints" : [ 502.5, 345.0, 362.75, 345.0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 2 ],
					"midpoints" : [ 342.5, 343.0, 256.0, 343.0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-45", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 1 ],
					"midpoints" : [ 170.0, 341.0, 149.25, 341.0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 1 ],
					"source" : [ "obj-51", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 4 ],
					"midpoints" : [ 611.5, 365.0, 469.5, 365.0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-66", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-15" : [ "live.text", "live.text", 0 ],
			"obj-54" : [ "live.tab", "live.tab", 0 ],
			"obj-66::obj-1::obj-1" : [ "textedit[7]", "textedit", 0 ],
			"obj-66::obj-1::obj-26" : [ "Curve1[7]", "Map", 0 ],
			"obj-66::obj-1::obj-27::obj-15" : [ "Unmap[11]", "unmap", 0 ],
			"obj-66::obj-1::obj-27::obj-19" : [ "Map[11]", "Map", 0 ],
			"obj-66::obj-1::obj-27::obj-20" : [ "Max[11]", "Max 1", 0 ],
			"obj-66::obj-1::obj-27::obj-26" : [ "Min[10]", "Min 1", 0 ],
			"obj-66::obj-1::obj-28" : [ "Bypass 1[8]", "Bypass 1", 0 ],
			"obj-66::obj-1::obj-44" : [ "live.numbox[8]", "Map", 0 ],
			"obj-66::obj-1::obj-69" : [ "live.toggle[8]", "live.toggle", 0 ],
			"obj-66::obj-2::obj-1" : [ "textedit[8]", "textedit", 0 ],
			"obj-66::obj-2::obj-26" : [ "Curve1[8]", "Map", 0 ],
			"obj-66::obj-2::obj-27::obj-15" : [ "Unmap[12]", "unmap", 0 ],
			"obj-66::obj-2::obj-27::obj-19" : [ "Map[12]", "Map", 0 ],
			"obj-66::obj-2::obj-27::obj-20" : [ "Max[12]", "Max 1", 0 ],
			"obj-66::obj-2::obj-27::obj-26" : [ "Min[11]", "Min 1", 0 ],
			"obj-66::obj-2::obj-28" : [ "Bypass 1[9]", "Bypass 1", 0 ],
			"obj-66::obj-2::obj-44" : [ "live.numbox[9]", "Map", 0 ],
			"obj-66::obj-2::obj-69" : [ "live.toggle[9]", "live.toggle", 0 ],
			"obj-66::obj-3::obj-1" : [ "textedit[9]", "textedit", 0 ],
			"obj-66::obj-3::obj-26" : [ "Curve1[9]", "Map", 0 ],
			"obj-66::obj-3::obj-27::obj-15" : [ "Unmap[13]", "unmap", 0 ],
			"obj-66::obj-3::obj-27::obj-19" : [ "Map[13]", "Map", 0 ],
			"obj-66::obj-3::obj-27::obj-20" : [ "Max[13]", "Max 1", 0 ],
			"obj-66::obj-3::obj-27::obj-26" : [ "Min[12]", "Min 1", 0 ],
			"obj-66::obj-3::obj-28" : [ "Bypass 1[10]", "Bypass 1", 0 ],
			"obj-66::obj-3::obj-44" : [ "live.numbox[10]", "Map", 0 ],
			"obj-66::obj-3::obj-69" : [ "live.toggle[10]", "live.toggle", 0 ],
			"obj-66::obj-4::obj-1" : [ "textedit[10]", "textedit", 0 ],
			"obj-66::obj-4::obj-26" : [ "Curve1[10]", "Map", 0 ],
			"obj-66::obj-4::obj-27::obj-15" : [ "Unmap[14]", "unmap", 0 ],
			"obj-66::obj-4::obj-27::obj-19" : [ "Map[14]", "Map", 0 ],
			"obj-66::obj-4::obj-27::obj-20" : [ "Max[14]", "Max 1", 0 ],
			"obj-66::obj-4::obj-27::obj-26" : [ "Min[6]", "Min 1", 0 ],
			"obj-66::obj-4::obj-28" : [ "Bypass 1[11]", "Bypass 1", 0 ],
			"obj-66::obj-4::obj-44" : [ "live.numbox[11]", "Map", 0 ],
			"obj-66::obj-4::obj-69" : [ "live.toggle[11]", "live.toggle", 0 ],
			"obj-66::obj-6::obj-1" : [ "textedit[13]", "textedit", 0 ],
			"obj-66::obj-6::obj-26" : [ "Curve1[13]", "Map", 0 ],
			"obj-66::obj-6::obj-27::obj-15" : [ "Unmap[17]", "unmap", 0 ],
			"obj-66::obj-6::obj-27::obj-19" : [ "Map[17]", "Map", 0 ],
			"obj-66::obj-6::obj-27::obj-20" : [ "Max[17]", "Max 1", 0 ],
			"obj-66::obj-6::obj-27::obj-26" : [ "Min[14]", "Min 1", 0 ],
			"obj-66::obj-6::obj-28" : [ "Bypass 1[14]", "Bypass 1", 0 ],
			"obj-66::obj-6::obj-44" : [ "live.numbox[14]", "Map", 0 ],
			"obj-66::obj-6::obj-69" : [ "live.toggle[14]", "live.toggle", 0 ],
			"obj-66::obj-7::obj-1" : [ "textedit[12]", "textedit", 0 ],
			"obj-66::obj-7::obj-26" : [ "Curve1[12]", "Map", 0 ],
			"obj-66::obj-7::obj-27::obj-15" : [ "Unmap[16]", "unmap", 0 ],
			"obj-66::obj-7::obj-27::obj-19" : [ "Map[16]", "Map", 0 ],
			"obj-66::obj-7::obj-27::obj-20" : [ "Max[16]", "Max 1", 0 ],
			"obj-66::obj-7::obj-27::obj-26" : [ "Min[13]", "Min 1", 0 ],
			"obj-66::obj-7::obj-28" : [ "Bypass 1[13]", "Bypass 1", 0 ],
			"obj-66::obj-7::obj-44" : [ "live.numbox[13]", "Map", 0 ],
			"obj-66::obj-7::obj-69" : [ "live.toggle[13]", "live.toggle", 0 ],
			"obj-66::obj-8::obj-1" : [ "textedit[11]", "textedit", 0 ],
			"obj-66::obj-8::obj-26" : [ "Curve1[11]", "Map", 0 ],
			"obj-66::obj-8::obj-27::obj-15" : [ "Unmap[15]", "unmap", 0 ],
			"obj-66::obj-8::obj-27::obj-19" : [ "Map[15]", "Map", 0 ],
			"obj-66::obj-8::obj-27::obj-20" : [ "Max[15]", "Max 1", 0 ],
			"obj-66::obj-8::obj-27::obj-26" : [ "Min[7]", "Min 1", 0 ],
			"obj-66::obj-8::obj-28" : [ "Bypass 1[12]", "Bypass 1", 0 ],
			"obj-66::obj-8::obj-44" : [ "live.numbox[12]", "Map", 0 ],
			"obj-66::obj-8::obj-69" : [ "live.toggle[12]", "live.toggle", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-66::obj-1::obj-26" : 				{
					"parameter_longname" : "Curve1[7]"
				}
,
				"obj-66::obj-1::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[11]"
				}
,
				"obj-66::obj-1::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[11]"
				}
,
				"obj-66::obj-1::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[11]"
				}
,
				"obj-66::obj-1::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[10]"
				}
,
				"obj-66::obj-1::obj-28" : 				{
					"parameter_longname" : "Bypass 1[8]"
				}
,
				"obj-66::obj-1::obj-44" : 				{
					"parameter_longname" : "live.numbox[8]"
				}
,
				"obj-66::obj-1::obj-69" : 				{
					"parameter_longname" : "live.toggle[8]"
				}
,
				"obj-66::obj-2::obj-26" : 				{
					"parameter_longname" : "Curve1[8]"
				}
,
				"obj-66::obj-2::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[12]"
				}
,
				"obj-66::obj-2::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[12]"
				}
,
				"obj-66::obj-2::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[12]"
				}
,
				"obj-66::obj-2::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[11]"
				}
,
				"obj-66::obj-2::obj-28" : 				{
					"parameter_longname" : "Bypass 1[9]"
				}
,
				"obj-66::obj-2::obj-44" : 				{
					"parameter_longname" : "live.numbox[9]"
				}
,
				"obj-66::obj-2::obj-69" : 				{
					"parameter_longname" : "live.toggle[9]"
				}
,
				"obj-66::obj-3::obj-26" : 				{
					"parameter_longname" : "Curve1[9]"
				}
,
				"obj-66::obj-3::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[13]"
				}
,
				"obj-66::obj-3::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[13]"
				}
,
				"obj-66::obj-3::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[13]"
				}
,
				"obj-66::obj-3::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[12]"
				}
,
				"obj-66::obj-3::obj-28" : 				{
					"parameter_longname" : "Bypass 1[10]"
				}
,
				"obj-66::obj-3::obj-44" : 				{
					"parameter_longname" : "live.numbox[10]"
				}
,
				"obj-66::obj-3::obj-69" : 				{
					"parameter_longname" : "live.toggle[10]"
				}
,
				"obj-66::obj-4::obj-26" : 				{
					"parameter_longname" : "Curve1[10]"
				}
,
				"obj-66::obj-4::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[14]"
				}
,
				"obj-66::obj-4::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[14]"
				}
,
				"obj-66::obj-4::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[14]"
				}
,
				"obj-66::obj-4::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[6]"
				}
,
				"obj-66::obj-4::obj-28" : 				{
					"parameter_longname" : "Bypass 1[11]"
				}
,
				"obj-66::obj-4::obj-44" : 				{
					"parameter_longname" : "live.numbox[11]"
				}
,
				"obj-66::obj-4::obj-69" : 				{
					"parameter_longname" : "live.toggle[11]"
				}
,
				"obj-66::obj-6::obj-26" : 				{
					"parameter_longname" : "Curve1[13]"
				}
,
				"obj-66::obj-6::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[17]"
				}
,
				"obj-66::obj-6::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[17]"
				}
,
				"obj-66::obj-6::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[17]"
				}
,
				"obj-66::obj-6::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[14]"
				}
,
				"obj-66::obj-6::obj-28" : 				{
					"parameter_longname" : "Bypass 1[14]"
				}
,
				"obj-66::obj-6::obj-44" : 				{
					"parameter_longname" : "live.numbox[14]"
				}
,
				"obj-66::obj-6::obj-69" : 				{
					"parameter_longname" : "live.toggle[14]"
				}
,
				"obj-66::obj-7::obj-26" : 				{
					"parameter_longname" : "Curve1[12]"
				}
,
				"obj-66::obj-7::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[16]"
				}
,
				"obj-66::obj-7::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[16]"
				}
,
				"obj-66::obj-7::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[16]"
				}
,
				"obj-66::obj-7::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[13]"
				}
,
				"obj-66::obj-7::obj-28" : 				{
					"parameter_longname" : "Bypass 1[13]"
				}
,
				"obj-66::obj-7::obj-44" : 				{
					"parameter_longname" : "live.numbox[13]"
				}
,
				"obj-66::obj-7::obj-69" : 				{
					"parameter_longname" : "live.toggle[13]"
				}
,
				"obj-66::obj-8::obj-26" : 				{
					"parameter_longname" : "Curve1[11]"
				}
,
				"obj-66::obj-8::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[15]"
				}
,
				"obj-66::obj-8::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[15]"
				}
,
				"obj-66::obj-8::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[15]"
				}
,
				"obj-66::obj-8::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[7]"
				}
,
				"obj-66::obj-8::obj-28" : 				{
					"parameter_longname" : "Bypass 1[12]"
				}
,
				"obj-66::obj-8::obj-44" : 				{
					"parameter_longname" : "live.numbox[12]"
				}
,
				"obj-66::obj-8::obj-69" : 				{
					"parameter_longname" : "live.toggle[12]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "dunlap.ableton.tempoOps.maxpat",
				"bootpath" : "~/OneDrive - Dunlap Media/GitHub/randomMaxAbstractions",
				"patcherrelativepath" : "../../../randomMaxAbstractions",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "tpts.bpatcher.pmappers.maxpat",
				"bootpath" : "~/OneDrive - Dunlap Media/GitHub/twitchPlaysTheSynth/tpts.paramamapper/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "tpts.bpatcher.pmapper.maxpat",
				"bootpath" : "~/OneDrive - Dunlap Media/GitHub/twitchPlaysTheSynth/tpts.paramamapper/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "dunlap.changeOverBeats.maxpat",
				"bootpath" : "~/OneDrive - Dunlap Media/GitHub/randomMaxAbstractions",
				"patcherrelativepath" : "../../../randomMaxAbstractions",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "M4L.MapButtonMultiSingle.maxpat",
				"bootpath" : "~/OneDrive - Dunlap Media/GitHub/twitchPlaysTheSynth/tpts.paramamapper/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "stringFormat.js",
				"bootpath" : "~/OneDrive - Dunlap Media/GitHub/twitchPlaysTheSynth/tpts.paramamapper/code",
				"patcherrelativepath" : "../code",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "tpts.pmapper.checkForMelodyCommand.maxpat",
				"bootpath" : "~/OneDrive - Dunlap Media/GitHub/twitchPlaysTheSynth/tpts.paramamapper/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
		"editing_bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
	}

}
