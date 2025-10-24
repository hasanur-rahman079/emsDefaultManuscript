{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal - Customized for Editorial Management System
 * This version includes a hero section with logo, title, description and call-to-action buttons.
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the homepage
 * @uses $issue Issue Current issue
 *
 * @hook Templates::Index::journal []
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">

	{call_hook name="Templates::Index::journal"}

	{* Hero Section with Logo, Title, Description and CTA Buttons *}
	<section class="ems_hero_section">
		<div class="ems_hero_wrapper">
			<div class="ems_hero_left">
				{* Journal Thumbnail/Image *}
				{assign var="journalThumb" value=$currentContext->getLocalizedData('journalThumbnail')}
				{if $journalThumb}
					<div class="ems_hero_image">
						<img src="{$publicFilesDir}/{$journalThumb.uploadName|escape:"url"}"{if $journalThumb.altText} alt="{$journalThumb.altText|escape}"{/if}>
					</div>
				{else}
					<div class="ems_hero_image ems_hero_placeholder">
						<div class="ems_placeholder_content">
							<span class="ems_placeholder_text">{$currentJournal->getLocalizedName()|escape}</span>
						</div>
					</div>
				{/if}
			</div>

			<div class="ems_hero_right">
				{* Journal Title *}
				<h1 class="ems_hero_title">
					{$currentJournal->getLocalizedName()|escape}
				</h1>

				{* Journal Description *}
				{if $currentContext->getLocalizedData('description')}
					<div class="ems_hero_description">
						{$currentContext->getLocalizedData('description')}
					</div>
				{/if}

				{* Call to Action Buttons *}
				<div class="ems_hero_buttons">
					<a href="{url page="about" op="submissions"}" class="ems_button ems_button_primary">
						{translate key="about.submissions"}
					</a>
					<a href="{url page="user" op="register"}" class="ems_button ems_button_secondary">
						{translate key="user.register"}
					</a>
					<a href="{url page="login"}" class="ems_button ems_button_tertiary">
						{translate key="user.login"}
					</a>
				</div>

				{* Partner/Service Logos *}
				<div class="ems_hero_partners">
					{* You can add partner logos here - these are placeholder examples *}
					{* Uncomment and customize as needed *}
					{* <img src="{$baseUrl}/plugins/themes/defaultManuscript/images/ithenticate_logo.png" alt="iThenticate"> *}
					{* <img src="{$baseUrl}/plugins/themes/defaultManuscript/images/crossref_logo.png" alt="Crossref"> *}
				</div>
			</div>
		</div>
	</section>

	{if $highlights->count()}
		{include file="frontend/components/highlights.tpl" highlights=$highlights}
	{/if}

	{include file="frontend/objects/announcements_list.tpl" numAnnouncements=$numAnnouncementsHomepage}

	{* Latest issue *}
	{if $issue}
		<section class="current_issue">
			<a id="homepageIssue"></a>
			<h2>
				{translate key="journal.currentIssue"}
			</h2>
			<div class="current_issue_title">
				{$issue->getIssueIdentification()|escape}
			</div>
			{include file="frontend/objects/issue_toc.tpl" heading="h3"}
			<a href="{url router=PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="read_more">
				{translate key="journal.viewAllIssues"}
			</a>
		</section>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}

