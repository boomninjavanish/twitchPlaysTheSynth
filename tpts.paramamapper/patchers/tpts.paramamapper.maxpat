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
		"rect" : [ 611.0, 177.0, 1505.0, 1229.0 ],
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
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 416.0, 908.0, 75.0, 22.0 ],
					"text" : "r ---reminder"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 416.0, 610.0, 75.0, 22.0 ],
					"text" : "r ---reminder"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 493.0, 317.0, 77.0, 22.0 ],
					"text" : "s ---reminder"
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
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.666666666666686, 908.0, 97.0, 22.0 ],
					"text" : "r ---commandsIn"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.666666666666686, 610.0, 97.0, 22.0 ],
					"text" : "r ---commandsIn"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 193.0, 323.0, 99.0, 22.0 ],
					"text" : "s ---commandsIn"
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
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 288.333333333333371, 908.0, 51.0, 22.0 ],
					"text" : "r ---bpm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 288.333333333333371, 610.0, 51.0, 22.0 ],
					"text" : "r ---bpm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 388.0, 317.0, 53.0, 22.0 ],
					"text" : "s ---bpm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 352.0, 190.0, 89.0, 22.0 ],
					"text" : "route /tpts/bpm"
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
					"text" : "udpreceive 8008"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 908.0, 66.0, 22.0 ],
					"text" : "r ---bypass"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 610.0, 66.0, 22.0 ],
					"text" : "r ---bypass"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 60.0, 323.0, 68.0, 22.0 ],
					"text" : "s ---bypass"
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
					"patching_rect" : [ 33.0, 237.5, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 329.102661967277527, 9.5, 44.0, 15.0 ],
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
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.0, 491.0, 95.0, 22.0 ],
					"text" : "s ---makeParam"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 169.0, 1012.0, 93.0, 22.0 ],
					"text" : "r ---makeParam"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.0, 831.0, 95.0, 22.0 ],
					"text" : "s ---makeParam"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 1100.0, 131.0, 22.0 ],
					"text" : "prepend /tpts/twitchBot"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.0, 1147.0, 138.0, 22.0 ],
					"text" : "udpsend 127.0.0.1 8008"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-6",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "tpts.bpatcher.pmapper.maxpat",
					"numinlets" : 4,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 965.874999821186066, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 140.874999821186066, 373.102661967277527, 21.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-7",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "tpts.bpatcher.pmapper.maxpat",
					"numinlets" : 4,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 878.0, 723.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 124.874999821186066, 373.102661967277527, 21.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-8",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "tpts.bpatcher.pmapper.maxpat",
					"numinlets" : 4,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 454.0, 723.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 108.874999821186066, 373.102661967277527, 21.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 132.0, 74.0, 128.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.631181195378304, 31.637375310063362, 56.0, 18.0 ],
					"text" : "Curr Val",
					"textcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "tpts.bpatcher.pmapper.maxpat",
					"numinlets" : 4,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 723.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 92.874999821186066, 373.102661967277527, 21.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "tpts.bpatcher.pmapper.maxpat",
					"numinlets" : 4,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 878.0, 385.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 76.874999821186066, 373.102661967277527, 21.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "tpts.bpatcher.pmapper.maxpat",
					"numinlets" : 4,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 454.0, 385.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 60.874999821186066, 373.102661967277527, 21.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "tpts.bpatcher.pmapper.maxpat",
					"numinlets" : 4,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 385.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 44.874999821186066, 373.102661967277527, 21.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 78.0, 74.0, 52.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 312.237624034285545, 31.637375310063362, 34.396039575338364, 18.0 ],
					"text" : "Curve",
					"textcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-30",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 39.0, 74.0, 32.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 272.712390536595194, 31.637375310063362, 29.0, 18.0 ],
					"text" : "Max",
					"textcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-31",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 74.0, 32.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 233.76540718972683, 31.637375310063362, 24.0, 18.0 ],
					"text" : "Min",
					"textcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 51.0, 126.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.749999165534973, 31.637375310063362, 54.0, 18.0 ],
					"text" : "Parameter",
					"textcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ]
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
					"patching_rect" : [ 0.0, 31.0, 137.0, 16.0 ],
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
					"patching_rect" : [ 0.0, 3.0, 253.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.749999165534973, 4.0, 70.0, 26.0 ],
					"text" : "!tpts",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 42.5, 408.0, 42.5, 408.0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"midpoints" : [ 42.5, 1125.0, 42.5, 1125.0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"midpoints" : [ 178.5, 1086.0, 42.5, 1086.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 1 ],
					"midpoints" : [ 170.0, 213.0, 170.166666666666686, 213.0 ],
					"order" : 3,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"midpoints" : [ 170.0, 372.0, 591.166666666666742, 372.0 ],
					"order" : 2,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"midpoints" : [ 170.0, 309.0, 202.5, 309.0 ],
					"order" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"midpoints" : [ 170.0, 372.0, 1015.166666666666742, 372.0 ],
					"order" : 1,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 42.5, 255.0, 42.5, 255.0 ],
					"order" : 3,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 42.5, 309.0, 69.5, 309.0 ],
					"order" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 42.5, 372.0, 463.5, 372.0 ],
					"order" : 2,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"midpoints" : [ 42.5, 372.0, 887.5, 372.0 ],
					"order" : 1,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"midpoints" : [ 42.5, 633.0, 42.5, 633.0 ],
					"order" : 2,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"midpoints" : [ 42.5, 708.0, 887.5, 708.0 ],
					"order" : 1,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 42.5, 708.0, 463.5, 708.0 ],
					"order" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 42.5, 933.0, 42.5, 933.0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 170.0, 144.0, 170.0, 144.0 ],
					"order" : 2,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"midpoints" : [ 170.0, 177.0, 361.5, 177.0 ],
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
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 463.5, 477.0, 42.5, 477.0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 2 ],
					"midpoints" : [ 361.5, 372.0, 297.833333333333371, 372.0 ],
					"order" : 3,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 2 ],
					"midpoints" : [ 361.5, 372.0, 718.833333333333371, 372.0 ],
					"order" : 2,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"midpoints" : [ 361.5, 303.0, 397.5, 303.0 ],
					"order" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 2 ],
					"midpoints" : [ 361.5, 372.0, 1142.833333333333485, 372.0 ],
					"order" : 1,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"midpoints" : [ 170.166666666666686, 633.0, 170.166666666666686, 633.0 ],
					"order" : 2,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"midpoints" : [ 170.166666666666686, 708.0, 1015.166666666666742, 708.0 ],
					"order" : 1,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"midpoints" : [ 170.166666666666686, 708.0, 591.166666666666742, 708.0 ],
					"order" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 2 ],
					"midpoints" : [ 297.833333333333371, 633.0, 297.833333333333371, 633.0 ],
					"order" : 2,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"midpoints" : [ 297.833333333333371, 708.0, 1142.833333333333485, 708.0 ],
					"order" : 1,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 2 ],
					"midpoints" : [ 297.833333333333371, 708.0, 718.833333333333371, 708.0 ],
					"order" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 2 ],
					"midpoints" : [ 297.833333333333371, 933.0, 297.833333333333371, 933.0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
					"midpoints" : [ 170.166666666666686, 933.0, 170.166666666666686, 933.0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 3 ],
					"midpoints" : [ 502.5, 303.0, 453.0, 303.0, 453.0, 372.0, 425.5, 372.0 ],
					"order" : 3,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 3 ],
					"midpoints" : [ 502.5, 303.0, 846.5, 303.0 ],
					"order" : 2,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"midpoints" : [ 502.5, 213.0, 502.5, 213.0 ],
					"order" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 3 ],
					"midpoints" : [ 502.5, 303.0, 1270.5, 303.0 ],
					"order" : 1,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 887.5, 477.0, 42.5, 477.0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 3 ],
					"midpoints" : [ 425.5, 633.0, 425.5, 633.0 ],
					"order" : 2,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 3 ],
					"midpoints" : [ 425.5, 708.0, 1270.5, 708.0 ],
					"order" : 1,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 3 ],
					"midpoints" : [ 425.5, 708.0, 846.5, 708.0 ],
					"order" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 3 ],
					"midpoints" : [ 425.5, 933.0, 425.5, 933.0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 42.5, 747.0, 42.5, 747.0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"midpoints" : [ 42.5, 987.0, 42.5, 987.0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 887.5, 816.0, 42.5, 816.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 463.5, 816.0, 42.5, 816.0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-15" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-1" : [ "textedit", "textedit", 0 ],
			"obj-1::obj-146" : [ "Curve", "Map", 0 ],
			"obj-1::obj-2" : [ "live.numbox", "live.numbox", 0 ],
			"obj-1::obj-80" : [ "Bypass 1", "Bypass 1", 0 ],
			"obj-1::obj-81" : [ "live.toggle", "live.toggle", 0 ],
			"obj-1::obj-85::obj-15" : [ "Unmap[8]", "unmap", 0 ],
			"obj-1::obj-85::obj-19" : [ "Map[8]", "Map", 0 ],
			"obj-1::obj-85::obj-20" : [ "Max[8]", "Max", 0 ],
			"obj-1::obj-85::obj-26" : [ "Min[8]", "Min", 0 ],
			"obj-2::obj-1" : [ "textedit[1]", "textedit", 0 ],
			"obj-2::obj-146" : [ "Curve[1]", "Map", 0 ],
			"obj-2::obj-2" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-2::obj-80" : [ "Bypass 1[1]", "Bypass 1", 0 ],
			"obj-2::obj-81" : [ "live.toggle[1]", "live.toggle", 0 ],
			"obj-2::obj-85::obj-15" : [ "Unmap[1]", "unmap", 0 ],
			"obj-2::obj-85::obj-19" : [ "Map[1]", "Map", 0 ],
			"obj-2::obj-85::obj-20" : [ "Max[1]", "Max", 0 ],
			"obj-2::obj-85::obj-26" : [ "Min[1]", "Min", 0 ],
			"obj-3::obj-1" : [ "textedit[2]", "textedit", 0 ],
			"obj-3::obj-146" : [ "Curve[2]", "Map", 0 ],
			"obj-3::obj-2" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-3::obj-80" : [ "Bypass 1[2]", "Bypass 1", 0 ],
			"obj-3::obj-81" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-3::obj-85::obj-15" : [ "Unmap[2]", "unmap", 0 ],
			"obj-3::obj-85::obj-19" : [ "Map[2]", "Map", 0 ],
			"obj-3::obj-85::obj-20" : [ "Max[2]", "Max", 0 ],
			"obj-3::obj-85::obj-26" : [ "Min[2]", "Min", 0 ],
			"obj-4::obj-1" : [ "textedit[3]", "textedit", 0 ],
			"obj-4::obj-146" : [ "Curve[3]", "Map", 0 ],
			"obj-4::obj-2" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-4::obj-80" : [ "Bypass 1[3]", "Bypass 1", 0 ],
			"obj-4::obj-81" : [ "live.toggle[3]", "live.toggle", 0 ],
			"obj-4::obj-85::obj-15" : [ "Unmap[3]", "unmap", 0 ],
			"obj-4::obj-85::obj-19" : [ "Map[3]", "Map", 0 ],
			"obj-4::obj-85::obj-20" : [ "Max[9]", "Max", 0 ],
			"obj-4::obj-85::obj-26" : [ "Min[3]", "Min", 0 ],
			"obj-6::obj-1" : [ "textedit[6]", "textedit", 0 ],
			"obj-6::obj-146" : [ "Curve[4]", "Map", 0 ],
			"obj-6::obj-2" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-6::obj-80" : [ "Bypass 1[4]", "Bypass 1", 0 ],
			"obj-6::obj-81" : [ "live.toggle[4]", "live.toggle", 0 ],
			"obj-6::obj-85::obj-15" : [ "Unmap[4]", "unmap", 0 ],
			"obj-6::obj-85::obj-19" : [ "Map[4]", "Map", 0 ],
			"obj-6::obj-85::obj-20" : [ "Max[3]", "Max", 0 ],
			"obj-6::obj-85::obj-26" : [ "Min[4]", "Min", 0 ],
			"obj-7::obj-1" : [ "textedit[5]", "textedit", 0 ],
			"obj-7::obj-146" : [ "Curve[5]", "Map", 0 ],
			"obj-7::obj-2" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-7::obj-80" : [ "Bypass 1[5]", "Bypass 1", 0 ],
			"obj-7::obj-81" : [ "live.toggle[5]", "live.toggle", 0 ],
			"obj-7::obj-85::obj-15" : [ "Unmap[5]", "unmap", 0 ],
			"obj-7::obj-85::obj-19" : [ "Map[5]", "Map", 0 ],
			"obj-7::obj-85::obj-20" : [ "Max[4]", "Max", 0 ],
			"obj-7::obj-85::obj-26" : [ "Min[5]", "Min", 0 ],
			"obj-8::obj-1" : [ "textedit[4]", "textedit", 0 ],
			"obj-8::obj-146" : [ "Curve[6]", "Map", 0 ],
			"obj-8::obj-2" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-8::obj-80" : [ "Bypass 1[6]", "Bypass 1", 0 ],
			"obj-8::obj-81" : [ "live.toggle[6]", "live.toggle", 0 ],
			"obj-8::obj-85::obj-15" : [ "Unmap[6]", "unmap", 0 ],
			"obj-8::obj-85::obj-19" : [ "Map[6]", "Map", 0 ],
			"obj-8::obj-85::obj-20" : [ "Max[5]", "Max", 0 ],
			"obj-8::obj-85::obj-26" : [ "Min[6]", "Min", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-2::obj-146" : 				{
					"parameter_longname" : "Curve[1]"
				}
,
				"obj-2::obj-2" : 				{
					"parameter_longname" : "live.numbox[1]"
				}
,
				"obj-2::obj-80" : 				{
					"parameter_longname" : "Bypass 1[1]"
				}
,
				"obj-2::obj-81" : 				{
					"parameter_longname" : "live.toggle[1]"
				}
,
				"obj-2::obj-85::obj-15" : 				{
					"parameter_longname" : "Unmap[1]"
				}
,
				"obj-2::obj-85::obj-19" : 				{
					"parameter_longname" : "Map[1]"
				}
,
				"obj-2::obj-85::obj-20" : 				{
					"parameter_longname" : "Max[1]"
				}
,
				"obj-2::obj-85::obj-26" : 				{
					"parameter_longname" : "Min[1]"
				}
,
				"obj-3::obj-146" : 				{
					"parameter_longname" : "Curve[2]"
				}
,
				"obj-3::obj-2" : 				{
					"parameter_longname" : "live.numbox[2]"
				}
,
				"obj-3::obj-80" : 				{
					"parameter_longname" : "Bypass 1[2]"
				}
,
				"obj-3::obj-81" : 				{
					"parameter_longname" : "live.toggle[2]"
				}
,
				"obj-3::obj-85::obj-15" : 				{
					"parameter_longname" : "Unmap[2]"
				}
,
				"obj-3::obj-85::obj-19" : 				{
					"parameter_longname" : "Map[2]"
				}
,
				"obj-3::obj-85::obj-20" : 				{
					"parameter_longname" : "Max[2]"
				}
,
				"obj-3::obj-85::obj-26" : 				{
					"parameter_longname" : "Min[2]"
				}
,
				"obj-4::obj-146" : 				{
					"parameter_longname" : "Curve[3]"
				}
,
				"obj-4::obj-2" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-4::obj-80" : 				{
					"parameter_longname" : "Bypass 1[3]"
				}
,
				"obj-4::obj-81" : 				{
					"parameter_longname" : "live.toggle[3]"
				}
,
				"obj-4::obj-85::obj-15" : 				{
					"parameter_longname" : "Unmap[3]"
				}
,
				"obj-4::obj-85::obj-19" : 				{
					"parameter_longname" : "Map[3]"
				}
,
				"obj-4::obj-85::obj-20" : 				{
					"parameter_longname" : "Max[9]"
				}
,
				"obj-4::obj-85::obj-26" : 				{
					"parameter_longname" : "Min[3]"
				}
,
				"obj-6::obj-146" : 				{
					"parameter_longname" : "Curve[4]"
				}
,
				"obj-6::obj-2" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-6::obj-80" : 				{
					"parameter_longname" : "Bypass 1[4]"
				}
,
				"obj-6::obj-81" : 				{
					"parameter_longname" : "live.toggle[4]"
				}
,
				"obj-6::obj-85::obj-15" : 				{
					"parameter_longname" : "Unmap[4]"
				}
,
				"obj-6::obj-85::obj-19" : 				{
					"parameter_longname" : "Map[4]"
				}
,
				"obj-6::obj-85::obj-20" : 				{
					"parameter_longname" : "Max[3]"
				}
,
				"obj-6::obj-85::obj-26" : 				{
					"parameter_longname" : "Min[4]"
				}
,
				"obj-7::obj-146" : 				{
					"parameter_longname" : "Curve[5]"
				}
,
				"obj-7::obj-2" : 				{
					"parameter_longname" : "live.numbox[5]"
				}
,
				"obj-7::obj-80" : 				{
					"parameter_longname" : "Bypass 1[5]"
				}
,
				"obj-7::obj-81" : 				{
					"parameter_longname" : "live.toggle[5]"
				}
,
				"obj-7::obj-85::obj-15" : 				{
					"parameter_longname" : "Unmap[5]"
				}
,
				"obj-7::obj-85::obj-19" : 				{
					"parameter_longname" : "Map[5]"
				}
,
				"obj-7::obj-85::obj-20" : 				{
					"parameter_longname" : "Max[4]"
				}
,
				"obj-7::obj-85::obj-26" : 				{
					"parameter_longname" : "Min[5]"
				}
,
				"obj-8::obj-146" : 				{
					"parameter_longname" : "Curve[6]"
				}
,
				"obj-8::obj-2" : 				{
					"parameter_longname" : "live.numbox[6]"
				}
,
				"obj-8::obj-80" : 				{
					"parameter_longname" : "Bypass 1[6]"
				}
,
				"obj-8::obj-81" : 				{
					"parameter_longname" : "live.toggle[6]"
				}
,
				"obj-8::obj-85::obj-15" : 				{
					"parameter_longname" : "Unmap[6]"
				}
,
				"obj-8::obj-85::obj-19" : 				{
					"parameter_longname" : "Map[6]"
				}
,
				"obj-8::obj-85::obj-20" : 				{
					"parameter_longname" : "Max[5]"
				}
,
				"obj-8::obj-85::obj-26" : 				{
					"parameter_longname" : "Min[6]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "tpts.bpatcher.pmapper.maxpat",
				"bootpath" : "~/Documents/GitHub/twitchPlaysTheSynth/tpts.paramamapper/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "M4L.MapButtonMultiSingle.maxpat",
				"bootpath" : "~/Documents/GitHub/twitchPlaysTheSynth/tpts.paramamapper/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "stringFormat.js",
				"bootpath" : "~/Documents/GitHub/twitchPlaysTheSynth/tpts.paramamapper/code",
				"patcherrelativepath" : "../code",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "dunlap.changeOverBeats.maxpat",
				"bootpath" : "~/Documents/GitHub/randomMaxAbstractions",
				"patcherrelativepath" : "../../../randomMaxAbstractions",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
	}

}
