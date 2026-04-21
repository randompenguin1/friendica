{{*
  * Copyright (C) 2010-2024, the Friendica project
  * SPDX-FileCopyrightText: 2010-2024 the Friendica project
  *
  * SPDX-License-Identifier: AGPL-3.0-or-later
  *}}
<script>
	function showHidePagesList() {
		if ($("li[id^='pages-widget-entry-extended-']").is(':visible')) {
			$("li[id^='pages-widget-entry-extended-']").hide();
			$("li#pages-widget-collapse").html('{{$showmore}}');

		} else {
			$("li[id^='pages-widget-entry-extended-']").show();
			$("li#pages-widget-collapse").html('{{$showless}}');
		}
	}
</script>
<nav id="pages-list-sidebar-frame">
	<span id="pages-list-sidebar-inflated" class="widget inflated fakelink">
		<button class="fakelink" onclick="openCloseWidget('pages-list-sidebar', 'pages-list-sidebar-inflated');"
			aria-expanded="false">
			<h3>{{$title}}</h3>
		</button>
	</span>
	<div id="pages-list-sidebar" class="widget">
		<div id="sidebar-pages-header" class="sidebar-widget-header">
			<button class="fakelink" onclick="openCloseWidget('pages-list-sidebar', 'pages-list-sidebar-inflated');" aria-expanded="true">
				<h3>{{$title}}</h3>
			</button>
			<a class="pull-right widget-action widget-action-top faded-icon" id="sidebar-new-page"
				href="{{$new_page}}" data-toggle="tooltip" title="{{$create_new_page}}">
				<i class="icon icon-plus fa fa-plus" aria-hidden="true"></i>
			</a>
			{{if $addon_page_directory_enabled}}
				<a class="pull-right widget-action widget-action-top faded-icon" id="sidebar-pages-directory"
					href="/pagesdirectory" data-toggle="tooltip" title="{{$visit_pagesdirectory}}">
					<i class="fa fa-search" aria-hidden="true"></i>
				</a>
			{{/if}}
		</div>
		<div id="sidebar-pages-list" class="sidebar-widget-list">
			{{* The list of available pages *}}
			<ul id="pages-list-sidebar-ul">
				{{foreach $pages as $page}}
					{{if $page.id <= $visible_pages}}
						<li class="pages-widget-entry page-{{$page.cid}}" id="page-widget-entry-{{$page.id}}">
							<span class="notify badge pull-right"></span>
							<a href="{{$page.external_url}}" title="{{$page.link_desc}}" class="label sparkle" target="_blank" rel="noopener noreferrer">
								<img class="pages-list-img" src="{{$page.micro}}" alt="{{$page.link_desc}}" />
							</a>
							<a class="pages-widget-link" id="pages-widget-link-{{$page.id}}" href="{{$page.url}}">{{$page.name}}</a>
						</li>
					{{/if}}

					{{if $page.id > $visible_pages}}
						<li class="pages-widget-entry page-{{$page.cid}}" id="pages-widget-entry-extended-{{$page.id}}" style="display: none;">
							<span class="notify badge pull-right"></span>
							<a href="{{$page.external_url}}" title="{{$page.link_desc}}" class="label sparkle" target="_blank" rel="noopener noreferrer">
								<img class="pages-list-img" src="{{$page.micro}}" alt="{{$page.link_desc}}" />
							</a>
							<a class="pages-widget-link" id="page-widget-link-{{$page.id}}" href="{{$page.url}}">{{$page.name}}</a>
						</li>
					{{/if}}
				{{/foreach}}

				{{if $total > $visible_pages }}
					<li onclick="showHidePagesList(); return false;" id="pages-widget-collapse" class="pages-widget-link fakelink tool">{{$showmore}}</li>
				{{/if}}
			</ul>
		</div>
	</div>
</nav>
<script>
	initWidget('pages-list-sidebar', 'pages-list-sidebar-inflated');
</script>
