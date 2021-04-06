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
		"rect" : [ 706.0, 124.0, 1606.0, 1267.0 ],
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
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-60",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1554.0, 198.0, 126.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, -1.362624689936638, 54.0, 18.0 ],
					"text" : "Parameter",
					"textcolor" : [ 1.0, 1.0, 1.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-58",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1428.237624034285545, 198.0, 102.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 236.76540718972683, -1.362624689936638, 70.396039575338364, 18.0 ],
					"text" : "Values",
					"textcolor" : [ 1.0, 1.0, 1.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-59",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1296.0, 198.0, 128.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.631181195378304, -1.362624689936638, 56.0, 18.0 ],
					"text" : "Names",
					"textcolor" : [ 1.0, 1.0, 1.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1296.0, 127.0, 107.0, 22.0 ],
					"text" : "textcolor 1. 1. 1. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1427.0, 127.0, 107.0, 22.0 ],
					"text" : "textcolor 1. 1. 1. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1296.0, 40.0, 87.0, 22.0 ],
					"text" : "r ---tabNumber"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 1296.0, 80.0, 44.0, 22.0 ],
					"text" : "sel 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1024.0, 127.0, 107.0, 22.0 ],
					"text" : "textcolor 1. 1. 1. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 892.0, 127.0, 107.0, 22.0 ],
					"text" : "textcolor 1. 1. 1. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 892.0, 40.0, 87.0, 22.0 ],
					"text" : "r ---tabNumber"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 892.0, 80.0, 44.0, 22.0 ],
					"text" : "sel 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 416.0, 793.0, 87.0, 22.0 ],
					"text" : "r ---tabNumber"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 422.0, 533.0, 87.0, 22.0 ],
					"text" : "r ---tabNumber"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 692.0, 331.0, 89.0, 22.0 ],
					"text" : "s ---tabNumber"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-39",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 696.0, 275.5, 101.0, 37.0 ],
					"text" : "tab number (0,1)"
				}

			}
, 			{
				"box" : 				{
					"comment" : "tab number (0,1)",
					"id" : "obj-38",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 664.0, 279.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 57.5, 945.0, 93.0, 22.0 ],
					"text" : "r ---makeParam"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-35",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 67.5, 1006.5, 102.0, 37.0 ],
					"text" : "message output"
				}

			}
, 			{
				"box" : 				{
					"comment" : "message output",
					"id" : "obj-32",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.0, 1010.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 39.0, 714.0, 95.0, 22.0 ],
					"text" : "s ---makeParam"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.0, 481.0, 95.0, 22.0 ],
					"text" : "s ---makeParam"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 320.25, 793.0, 75.0, 22.0 ],
					"text" : "r ---reminder"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 128.75, 826.0, 97.0, 22.0 ],
					"text" : "r ---commandsIn"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 224.5, 793.0, 51.0, 22.0 ],
					"text" : "r ---bpm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 793.0, 66.0, 22.0 ],
					"text" : "r ---bypass"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 326.0, 533.0, 75.0, 22.0 ],
					"text" : "r ---reminder"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 134.75, 557.0, 97.0, 22.0 ],
					"text" : "r ---commandsIn"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 230.5, 533.0, 51.0, 22.0 ],
					"text" : "r ---bpm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 39.0, 540.0, 66.0, 22.0 ],
					"text" : "r ---bypass"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 448.0, 326.0, 77.0, 22.0 ],
					"text" : "s ---reminder"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 180.0, 228.0, 99.0, 22.0 ],
					"text" : "s ---commandsIn"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 309.0, 279.0, 53.0, 22.0 ],
					"text" : "s ---bpm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 62.0, 175.0, 68.0, 22.0 ],
					"text" : "s ---bypass"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-15",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 322.0, 224.5, 113.0, 37.0 ],
					"text" : "current BPM (float)"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-14",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 195.237624034285545, 175.0, 229.0, 37.0 ],
					"text" : "mapper messages (list; <mapper name> <value> <beats>)"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-13",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 448.0, 275.5, 190.0, 37.0 ],
					"text" : "reload mapperNames into tpts script (bang)"
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
					"patching_rect" : [ 67.5, 112.5, 83.0, 51.0 ],
					"text" : "bypass \n    0 = off\n    1 = on"
				}

			}
, 			{
				"box" : 				{
					"comment" : "reload mapperNames into tpts script (bang)",
					"id" : "obj-12",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 416.0, 279.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "current BPM (float)",
					"id" : "obj-11",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 288.333333333333371, 228.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "mapper messages (list; <mapper name> <value> <beats>)",
					"id" : "obj-10",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.666666666666686, 175.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "bypass (0 = off; 1 = on)",
					"id" : "obj-9",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 123.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 9.5,
					"id" : "obj-52",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1156.237624034285545, 198.0, 102.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 365.237624034285545, -1.362624689936638, 70.396039575338364, 18.0 ],
					"text" : "Access Level",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
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
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 894.874999821186066, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 107.874999821186066, 431.102661967277527, 21.0 ],
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
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 884.0, 654.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 91.874999821186066, 431.102661967277527, 21.0 ],
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
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 460.0, 654.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 75.874999821186066, 431.102661967277527, 21.0 ],
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
					"patching_rect" : [ 1024.0, 198.0, 128.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 100.631181195378304, -1.362624689936638, 56.0, 18.0 ],
					"text" : "Curr Val",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
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
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 39.0, 654.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 59.874999821186066, 431.102661967277527, 21.0 ],
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
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 878.0, 413.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 43.874999821186066, 431.102661967277527, 21.0 ],
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
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 454.0, 413.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 27.874999821186066, 431.102661967277527, 21.0 ],
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
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 413.0, 402.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 11.874999821186066, 431.102661967277527, 21.0 ],
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
					"patching_rect" : [ 970.0, 198.0, 52.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 328.841584458947182, -1.362624689936638, 34.396039575338364, 18.0 ],
					"text" : "Curve",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
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
					"patching_rect" : [ 931.0, 198.0, 32.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 293.712390536595194, -1.362624689936638, 29.0, 18.0 ],
					"text" : "Max",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
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
					"patching_rect" : [ 892.0, 198.0, 32.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 251.76540718972683, -1.362624689936638, 24.0, 18.0 ],
					"text" : "Min",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
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
					"patching_rect" : [ 762.0, 198.0, 126.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 21.749999165534973, -1.362624689936638, 54.0, 18.0 ],
					"text" : "Parameter",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 1 ],
					"midpoints" : [ 170.166666666666686, 386.0, 138.25, 386.0 ],
					"order" : 3,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"midpoints" : [ 170.166666666666686, 264.0, 291.0, 264.0, 291.0, 372.0, 559.25, 372.0 ],
					"order" : 2,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"midpoints" : [ 170.166666666666686, 264.0, 291.0, 264.0, 291.0, 372.0, 983.25, 372.0 ],
					"order" : 1,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 2 ],
					"midpoints" : [ 297.833333333333371, 384.0, 234.0, 384.0 ],
					"order" : 3,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 2 ],
					"midpoints" : [ 297.833333333333371, 372.0, 655.0, 372.0 ],
					"order" : 2,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"order" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 2 ],
					"midpoints" : [ 297.833333333333371, 372.0, 1079.0, 372.0 ],
					"order" : 1,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 3 ],
					"midpoints" : [ 425.5, 388.0, 329.75, 388.0 ],
					"order" : 3,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 3 ],
					"midpoints" : [ 425.5, 372.0, 750.75, 372.0 ],
					"order" : 2,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"order" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 3 ],
					"midpoints" : [ 425.5, 372.0, 1174.75, 372.0 ],
					"order" : 1,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"order" : 2,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"midpoints" : [ 48.5, 607.0, 893.5, 607.0 ],
					"order" : 1,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 48.5, 607.0, 469.5, 607.0 ],
					"order" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 3 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 463.5, 468.0, 42.5, 468.0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 2 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"order" : 2,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"midpoints" : [ 144.25, 607.0, 989.25, 607.0 ],
					"order" : 1,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"midpoints" : [ 144.25, 607.0, 565.25, 607.0 ],
					"order" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 2 ],
					"order" : 2,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"midpoints" : [ 240.0, 607.0, 1085.0, 607.0 ],
					"order" : 1,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 2 ],
					"midpoints" : [ 240.0, 607.0, 661.0, 607.0 ],
					"order" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 887.5, 468.0, 42.5, 468.0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 3 ],
					"midpoints" : [ 335.5, 565.0, 335.75, 565.0 ],
					"order" : 2,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 3 ],
					"midpoints" : [ 335.5, 608.0, 1180.75, 608.0 ],
					"order" : 1,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 3 ],
					"midpoints" : [ 335.5, 607.0, 756.75, 607.0 ],
					"order" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 4 ],
					"midpoints" : [ 673.5, 399.0, 425.5, 399.0 ],
					"order" : 3,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 4 ],
					"midpoints" : [ 673.5, 399.0, 846.5, 399.0 ],
					"order" : 2,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 4 ],
					"midpoints" : [ 673.5, 399.0, 1270.5, 399.0 ],
					"order" : 1,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"order" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 48.5, 678.0, 48.5, 678.0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 4 ],
					"order" : 2,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"midpoints" : [ 431.5, 609.0, 1276.5, 609.0 ],
					"order" : 1,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 4 ],
					"midpoints" : [ 431.5, 609.0, 852.5, 609.0 ],
					"order" : 0,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 4 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-47", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 901.5, 183.0, 979.5, 183.0 ],
					"order" : 2,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"midpoints" : [ 901.5, 183.0, 940.5, 183.0 ],
					"order" : 3,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"midpoints" : [ 901.5, 150.0, 901.5, 150.0 ],
					"order" : 4,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"midpoints" : [ 901.5, 183.0, 771.5, 183.0 ],
					"order" : 5,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 901.5, 183.0, 1033.5, 183.0 ],
					"order" : 1,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"midpoints" : [ 901.5, 183.0, 1165.737624034285545, 183.0 ],
					"order" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 1033.5, 183.0, 979.5, 183.0 ],
					"order" : 2,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"midpoints" : [ 1033.5, 183.0, 940.5, 183.0 ],
					"order" : 3,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"midpoints" : [ 1033.5, 183.0, 901.5, 183.0 ],
					"order" : 4,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"midpoints" : [ 1033.5, 183.0, 771.5, 183.0 ],
					"order" : 5,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 1033.5, 150.0, 1033.5, 150.0 ],
					"order" : 1,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"midpoints" : [ 1033.5, 183.0, 1165.737624034285545, 183.0 ],
					"order" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-55", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"midpoints" : [ 1305.5, 183.0, 1437.737624034285545, 183.0 ],
					"order" : 1,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"midpoints" : [ 1305.5, 150.0, 1305.5, 150.0 ],
					"order" : 2,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 1305.5, 183.0, 1563.5, 183.0 ],
					"order" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"midpoints" : [ 1436.5, 150.0, 1437.737624034285545, 150.0 ],
					"order" : 1,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"midpoints" : [ 1436.5, 183.0, 1305.5, 183.0 ],
					"order" : 2,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 1436.5, 183.0, 1563.5, 183.0 ],
					"order" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 893.5, 699.0, 48.5, 699.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 469.5, 699.0, 48.5, 699.0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"order" : 3,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"order" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 42.5, 372.0, 463.5, 372.0 ],
					"order" : 2,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"midpoints" : [ 42.5, 372.0, 887.5, 372.0 ],
					"order" : 1,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1::obj-1" : [ "textedit[6]", "textedit", 0 ],
			"obj-1::obj-26" : [ "Curve1[6]", "Map", 0 ],
			"obj-1::obj-27::obj-15" : [ "Unmap[10]", "unmap", 0 ],
			"obj-1::obj-27::obj-19" : [ "Map[10]", "Map", 0 ],
			"obj-1::obj-27::obj-20" : [ "Max[10]", "Max 1", 0 ],
			"obj-1::obj-27::obj-26" : [ "Min[5]", "Min 1", 0 ],
			"obj-1::obj-28" : [ "Bypass 1[7]", "Bypass 1", 0 ],
			"obj-1::obj-44" : [ "live.numbox[7]", "live.numbox", 0 ],
			"obj-1::obj-69" : [ "live.toggle[7]", "live.toggle", 0 ],
			"obj-1::obj-96" : [ "textedit[1]", "textedit", 0 ],
			"obj-1::obj-97" : [ "textedit[2]", "textedit", 0 ],
			"obj-2::obj-1" : [ "textedit[5]", "textedit", 0 ],
			"obj-2::obj-26" : [ "Curve1[5]", "Map", 0 ],
			"obj-2::obj-27::obj-15" : [ "Unmap[4]", "unmap", 0 ],
			"obj-2::obj-27::obj-19" : [ "Map[4]", "Map", 0 ],
			"obj-2::obj-27::obj-20" : [ "Max[4]", "Max 1", 0 ],
			"obj-2::obj-27::obj-26" : [ "Min[4]", "Min 1", 0 ],
			"obj-2::obj-28" : [ "Bypass 1[6]", "Bypass 1", 0 ],
			"obj-2::obj-44" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-2::obj-69" : [ "live.toggle[6]", "live.toggle", 0 ],
			"obj-2::obj-96" : [ "textedit[7]", "textedit", 0 ],
			"obj-2::obj-97" : [ "textedit[8]", "textedit", 0 ],
			"obj-3::obj-1" : [ "textedit[4]", "textedit", 0 ],
			"obj-3::obj-26" : [ "Curve1[4]", "Map", 0 ],
			"obj-3::obj-27::obj-15" : [ "Unmap[3]", "unmap", 0 ],
			"obj-3::obj-27::obj-19" : [ "Map[3]", "Map", 0 ],
			"obj-3::obj-27::obj-20" : [ "Max[3]", "Max 1", 0 ],
			"obj-3::obj-27::obj-26" : [ "Min[3]", "Min 1", 0 ],
			"obj-3::obj-28" : [ "Bypass 1[5]", "Bypass 1", 0 ],
			"obj-3::obj-44" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-3::obj-69" : [ "live.toggle[5]", "live.toggle", 0 ],
			"obj-3::obj-96" : [ "textedit[9]", "textedit", 0 ],
			"obj-3::obj-97" : [ "textedit[10]", "textedit", 0 ],
			"obj-4::obj-1" : [ "textedit[3]", "textedit", 0 ],
			"obj-4::obj-26" : [ "Curve1[3]", "Map", 0 ],
			"obj-4::obj-27::obj-15" : [ "Unmap[9]", "unmap", 0 ],
			"obj-4::obj-27::obj-19" : [ "Map[9]", "Map", 0 ],
			"obj-4::obj-27::obj-20" : [ "Max[9]", "Max 1", 0 ],
			"obj-4::obj-27::obj-26" : [ "Min[9]", "Min 1", 0 ],
			"obj-4::obj-28" : [ "Bypass 1[4]", "Bypass 1", 0 ],
			"obj-4::obj-44" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-4::obj-69" : [ "live.toggle[4]", "live.toggle", 0 ],
			"obj-4::obj-96" : [ "textedit[11]", "textedit", 0 ],
			"obj-4::obj-97" : [ "textedit[12]", "textedit", 0 ],
			"obj-6::obj-1" : [ "textedit", "textedit", 0 ],
			"obj-6::obj-26" : [ "Curve1", "Map", 0 ],
			"obj-6::obj-27::obj-15" : [ "Unmap[8]", "unmap", 0 ],
			"obj-6::obj-27::obj-19" : [ "Map[8]", "Map", 0 ],
			"obj-6::obj-27::obj-20" : [ "Max[8]", "Max 1", 0 ],
			"obj-6::obj-27::obj-26" : [ "Min[8]", "Min 1", 0 ],
			"obj-6::obj-28" : [ "Bypass 1[1]", "Bypass 1", 0 ],
			"obj-6::obj-44" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-6::obj-69" : [ "live.toggle[1]", "live.toggle", 0 ],
			"obj-6::obj-96" : [ "textedit[20]", "textedit", 0 ],
			"obj-6::obj-97" : [ "textedit[19]", "textedit", 0 ],
			"obj-7::obj-1" : [ "textedit[17]", "textedit", 0 ],
			"obj-7::obj-26" : [ "Curve1[1]", "Map", 0 ],
			"obj-7::obj-27::obj-15" : [ "Unmap[1]", "unmap", 0 ],
			"obj-7::obj-27::obj-19" : [ "Map[1]", "Map", 0 ],
			"obj-7::obj-27::obj-20" : [ "Max[1]", "Max 1", 0 ],
			"obj-7::obj-27::obj-26" : [ "Min[1]", "Min 1", 0 ],
			"obj-7::obj-28" : [ "Bypass 1[2]", "Bypass 1", 0 ],
			"obj-7::obj-44" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-7::obj-69" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-7::obj-96" : [ "textedit[18]", "textedit", 0 ],
			"obj-7::obj-97" : [ "textedit[16]", "textedit", 0 ],
			"obj-8::obj-1" : [ "textedit[15]", "textedit", 0 ],
			"obj-8::obj-26" : [ "Curve1[2]", "Map", 0 ],
			"obj-8::obj-27::obj-15" : [ "Unmap[2]", "unmap", 0 ],
			"obj-8::obj-27::obj-19" : [ "Map[2]", "Map", 0 ],
			"obj-8::obj-27::obj-20" : [ "Max[2]", "Max 1", 0 ],
			"obj-8::obj-27::obj-26" : [ "Min[2]", "Min 1", 0 ],
			"obj-8::obj-28" : [ "Bypass 1[3]", "Bypass 1", 0 ],
			"obj-8::obj-44" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-8::obj-69" : [ "live.toggle[3]", "live.toggle", 0 ],
			"obj-8::obj-96" : [ "textedit[13]", "textedit", 0 ],
			"obj-8::obj-97" : [ "textedit[14]", "textedit", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-1::obj-26" : 				{
					"parameter_longname" : "Curve1[6]"
				}
,
				"obj-1::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[10]"
				}
,
				"obj-1::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[10]"
				}
,
				"obj-1::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[10]"
				}
,
				"obj-1::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[5]"
				}
,
				"obj-1::obj-28" : 				{
					"parameter_longname" : "Bypass 1[7]"
				}
,
				"obj-1::obj-44" : 				{
					"parameter_longname" : "live.numbox[7]",
					"parameter_shortname" : "live.numbox"
				}
,
				"obj-1::obj-69" : 				{
					"parameter_longname" : "live.toggle[7]"
				}
,
				"obj-2::obj-26" : 				{
					"parameter_longname" : "Curve1[5]"
				}
,
				"obj-2::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[4]"
				}
,
				"obj-2::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[4]"
				}
,
				"obj-2::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[4]"
				}
,
				"obj-2::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[4]"
				}
,
				"obj-2::obj-28" : 				{
					"parameter_longname" : "Bypass 1[6]"
				}
,
				"obj-2::obj-44" : 				{
					"parameter_longname" : "live.numbox[6]",
					"parameter_shortname" : "live.numbox"
				}
,
				"obj-2::obj-69" : 				{
					"parameter_longname" : "live.toggle[6]"
				}
,
				"obj-3::obj-26" : 				{
					"parameter_longname" : "Curve1[4]"
				}
,
				"obj-3::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[3]"
				}
,
				"obj-3::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[3]"
				}
,
				"obj-3::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[3]"
				}
,
				"obj-3::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[3]"
				}
,
				"obj-3::obj-28" : 				{
					"parameter_longname" : "Bypass 1[5]"
				}
,
				"obj-3::obj-44" : 				{
					"parameter_longname" : "live.numbox[5]",
					"parameter_shortname" : "live.numbox"
				}
,
				"obj-3::obj-69" : 				{
					"parameter_longname" : "live.toggle[5]"
				}
,
				"obj-4::obj-26" : 				{
					"parameter_longname" : "Curve1[3]"
				}
,
				"obj-4::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[9]"
				}
,
				"obj-4::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[9]"
				}
,
				"obj-4::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[9]"
				}
,
				"obj-4::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[9]"
				}
,
				"obj-4::obj-28" : 				{
					"parameter_longname" : "Bypass 1[4]"
				}
,
				"obj-4::obj-44" : 				{
					"parameter_longname" : "live.numbox[4]",
					"parameter_shortname" : "live.numbox"
				}
,
				"obj-4::obj-69" : 				{
					"parameter_longname" : "live.toggle[4]"
				}
,
				"obj-6::obj-44" : 				{
					"parameter_shortname" : "live.numbox"
				}
,
				"obj-7::obj-26" : 				{
					"parameter_longname" : "Curve1[1]"
				}
,
				"obj-7::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[1]"
				}
,
				"obj-7::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[1]"
				}
,
				"obj-7::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[1]"
				}
,
				"obj-7::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[1]"
				}
,
				"obj-7::obj-28" : 				{
					"parameter_longname" : "Bypass 1[2]"
				}
,
				"obj-7::obj-44" : 				{
					"parameter_longname" : "live.numbox[2]",
					"parameter_shortname" : "live.numbox"
				}
,
				"obj-7::obj-69" : 				{
					"parameter_longname" : "live.toggle[2]"
				}
,
				"obj-8::obj-26" : 				{
					"parameter_longname" : "Curve1[2]"
				}
,
				"obj-8::obj-27::obj-15" : 				{
					"parameter_longname" : "Unmap[2]"
				}
,
				"obj-8::obj-27::obj-19" : 				{
					"parameter_longname" : "Map[2]"
				}
,
				"obj-8::obj-27::obj-20" : 				{
					"parameter_longname" : "Max[2]"
				}
,
				"obj-8::obj-27::obj-26" : 				{
					"parameter_longname" : "Min[2]"
				}
,
				"obj-8::obj-28" : 				{
					"parameter_longname" : "Bypass 1[3]"
				}
,
				"obj-8::obj-44" : 				{
					"parameter_longname" : "live.numbox[3]",
					"parameter_shortname" : "live.numbox"
				}
,
				"obj-8::obj-69" : 				{
					"parameter_longname" : "live.toggle[3]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
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
		"autosave" : 0
	}

}
