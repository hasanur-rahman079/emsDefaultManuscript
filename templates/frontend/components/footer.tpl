{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer - Customized for Editorial Management System
 * This version uses the EMS brand logo in the footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *
 * @hook Templates::Common::Sidebar []
 * @hook Templates::Common::Footer::PageFooter []
 *}

	</div><!-- pkp_structure_main -->

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<div class="pkp_structure_sidebar left" role="complementary">
				{$sidebarCode}
			</div><!-- pkp_sidebar.left -->
		{/if}
	{/if}
</div><!-- pkp_structure_content -->

<div class="pkp_structure_footer_wrapper" role="contentinfo">
	<a id="pkp_content_footer"></a>

	<div class="pkp_structure_footer">

		{if $pageFooter}
			<div class="pkp_footer_content">
				{$pageFooter}
			</div>
		{/if}

		<div class="ems_footer_main">
			<div class="ems_footer_links">
				<ul>
					<li><a href="{url page="about"}">{translate key="about.aboutContext"}</a></li>
					<li><a href="{url page="about" op="privacy"}">{translate key="about.privacyStatement"}</a></li>
				</ul>
			</div>

			<div class="pkp_brand_footer">
				<a href="https://ems.pub" target="_blank" rel="noopener">
					{* Use EMS brand logo instead of default OJS logo *}
					<img alt="EMS Publishing" src="{$baseUrl}/plugins/themes/emsDefaultManuscript/ems_brand_logo_full.png">
				</a>
			</div>
		</div>

		<div class="ems_footer_copyright">
			<p>&copy; {$smarty.now|date_format:"Y"} ems.pub is a Editorial Management System by <a href="https://exomeit.com" target="_blank" rel="noopener">ExomeIT</a></p>
		</div>
	</div>
</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>

