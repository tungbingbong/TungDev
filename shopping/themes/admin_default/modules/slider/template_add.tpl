<!-- BEGIN: main -->
<div id="template-content">
   <!-- BEGIN: error_warning -->
    <div class="alert alert-danger">
        <i class="fa fa-exclamation-circle"></i> {error_warning}<i class="fa fa-times"></i>           
    </div>
    <!-- END: error_warning -->
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title" style="float:left"><i class="fa fa-pencil"></i> {CAPTION}</h3>
			<div class="pull-right">
				<button type="submit" form="form-stock" data-toggle="tooltip" class="btn btn-primary" title="{LANG.save}"><i class="fa fa-save"></i></button> 
				<a href="{CANCEL}" data-toggle="tooltip" class="btn btn-default" title="{LANG.cancel}"><i class="fa fa-reply"></i></a>
			</div>
			<div style="clear:both"></div>
		</div>
		<div class="panel-body">
			<form action="" method="post"  enctype="multipart/form-data" id="form-template" class="form-horizontal">
				<input type="hidden" name ="template_id" value="{DATA.template_id}" />
				<input name="save" type="hidden" value="1" />
 
				<div class="form-group required">
					<label class="col-sm-4 control-label" for="input-title"><span data-toggle="tooltip" title="{LANG.template_help}">{LANG.template_title} <i class="fa fa-question-circle" style="color:#2F71BB"></i></span></label>
					<div class="col-sm-20">
						<input type="text" name="title" value="{DATA.title}" placeholder="{LANG.template_title}" id="input-title" class="form-control" />
						<!-- BEGIN: error_title --><div class="text-danger">{error_title}</div><!-- END: error_title -->
					</div>
				</div> 		                  	 
				<div class="form-group">
					<label class="col-sm-4 control-label" for="input-status">{LANG.template_status}</label>
					<div class="col-sm-20">
						<select name="status" id="input-status" class="form-control">
							<!-- BEGIN: status -->
							<option value="{STATUS.key}" {STATUS.selected}>{STATUS.name}</option>
							<!-- END: status -->
						</select>
					</div>
				</div>
				<div align="center">
					<input class="btn btn-primary" type="submit" value="{LANG.save}">
					<a class="btn btn-primary" href="{CANCEL}" title="{LANG.cancel}">{LANG.cancel}</a> 
				</div>          
			</form>
		</div>
	</div>
</div>
<!-- END: main -->