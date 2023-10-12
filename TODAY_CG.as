package  {
	
	import flash.display.MovieClip;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.text.TextFormat;	
	import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
	import flash.display.Stage;
	import se.svt.caspar.ICommunicationManager;
	import se.svt.caspar.IRegisteredDataSharer;
	import se.svt.caspar.template.CasparTemplate;
	import caurina.transitions.Tweener;
	import caurina.transitions.properties.TextShortcuts;
	import fl.motion.Animator;
	import se.svt.caspar.templateHost.externalCommands.PlayCommand;

	
	public class TODAY_CG extends CasparTemplate {
		
		var animmain:anime = new anime();
		var animlokasi:animloc = new animloc();
		var animsubs:animsub = new animsub();
		public var f0_:String;
		public var f1_:String;
		public var f2_:String;
		public var tempf0:String;
		public var tempf1:String;
		public var tempf2:String;
		public var status:int;
		public var lstat:int;
		/*public var f0stat:int;
		public var f1stat:int;
		public var f2stat:int;*/
		
		TextShortcuts.init();
		
		private const customParameterDescription:XML = 	
		<parameters>
	   		<parameter id="f0" type="string" info="Textfield"/>
			<parameter id="f1" type="string" info="Textfield"/>
			<parameter id="f2" type="string" info="Textfield"/>
		</parameters>;
		
		private var init:Boolean = false;
		
		//private static function ScaleDownTextField(Input:String, Field:TextField, initialFieldWidth:int, initialFieldX:int, align:int):void
		//{
		//	var wi:int = initialFieldWidth;
		//	Field.autoSize = TextFieldAutoSize.LEFT;
		//	Field.scaleX = 1;
		//	Field.text = Input;
		//	if (wi < Field.width)
		//	{
		//		Field.scaleX = wi / Field.width;
		//	}

		//	if (align == 0)  //left
		//	{
		//		Field.x = initialFieldX;
		//	}
		//	if (align == 1)  //center
		//	{
		//		Field.x = initialFieldX + (initialFieldWidth - Field.width) / 2;
		//	}
		//	if (align == 2)  //right
		//	{
		//		Field.x = initialFieldX + initialFieldWidth - Field.width;
		//	}
		//}
		
		private static function ScaleDownTextFieldf0(Input0:String, Field0:TextField):void
		{
			var wi0:int = 390;
			Field0.autoSize = TextFieldAutoSize.LEFT;
			Field0.scaleX = 1;
			Field0.text = Input0;
			if (wi0 < Field0.width)
			{
				Field0.scaleX = wi0 / Field0.width;
			}
		}
		
		private static function ScaleDownTextFieldf1(Input1:String, Field1:TextField):void
		{
			var wi1:int = 1471;
			Field1.autoSize = TextFieldAutoSize.LEFT;
			Field1.scaleX = 1;
			Field1.text = Input1;
			if (wi1 < Field1.width)
			{
				Field1.scaleX = wi1 / Field1.width;
			}
		}
		
		private static function ScaleDownTextFieldf2(Input2:String, Field2:TextField):void
		{
			var wi2:int = 1471;
			Field2.autoSize = TextFieldAutoSize.LEFT;
			Field2.scaleX = 1;
			Field2.text = Input2;
			if (wi2 < Field2.width)
			{
				Field2.scaleX = wi2 / Field2.width;
			}
		}
		
		override public function SetData(xmlData:XML):void 
		{	
		   for each (var element:XML in xmlData.children())
		   {
			if (element.@id == "f0") 		
			  {
				  f0_ = element.data.@value;
				  f0.width = 390;
				  //ScaleDownTextField(f0_, f0, 380, f0.x, 0);
				  ScaleDownTextFieldf0(f0_, f0);
			  }		
			if (element.@id == "f1") 		
			  {
				  f1_ = element.data.@value;
				  f1.width = 1471;
				  ScaleDownTextFieldf1(f1_, f1);
				  //ScaleDownTextField(f1_, f1, 1460, f1.x, 0);
				  //Tweener.addTween(f1, {x:147.45, y:831.45, alpha:1, scaleY:0.8, scaleX:0.8, time:0.5, delay:0, transition:"easeOutSine"});
			  }		
			if (element.@id == "f2") 		
			  {
				  f2_ = element.data.@value;
				  f2.width = 1471;
				  //ScaleDownTextField(f2_, f2, 1460, f2.x, 0);
				  ScaleDownTextFieldf2(f2_, f2);
			  }
		   }
		   
		   if (f0_ == "")
		   {
			   if (lstat == 1)
			   {
				   animlokasi.gotoAndPlay(25);
				   lstat = 0;
			   }
		   }
		   
		   if (f0_ != "")
		   {
			   if (tempf0 != f0_)
			   {
				   f0.alpha = 0;
				   animlokasi.alpha = 1;
			       animlokasi.gotoAndPlay(1);
				   f0.x = 142,95;
			       Tweener.addTween(f0, {x:162.95, y:70.65, alpha:1, time:0.5, delay:0.5, transition:"easeOutSine"});
				   tempf0 = f0_;
				   lstat = 1;
			   }
		   }
		   
		   if (f1_ != "" && f2_ == "")
		   {
			   if (status == 2)
			   {
			       animsubs.gotoAndPlay(17);
			       Tweener.addTween(f1, {x:147.45, y:849.25, alpha:1, scaleY:1, time:0.5, delay:0.5, transition:"easeOutSine"});
			       //Tweener.addTween(f1, {x:147.45, y:831.45, alpha:1, scaleY:1.3, time:0.5, delay:0, transition:"easeOutSine"});
			       status = 1;
			   }
			   else
			   {
				   f1.alpha = 0;
				   status = 1;
				   Tweener.addTween(f1, {x:147.45, y:849.25, alpha:1, time:0.5, delay:0.5, transition:"easeOutSine"});
			   }
		   }
		   
		   if (f1_ !== "" && f2_ !== "")
		   {
			   if (status == 1)
			   {
				   f2.alpha = 0;
				   Tweener.addTween(f1, {x:147.45, y:835.20, alpha:1, scaleY:0.8, time:0.5, delay:0.5, transition:"easeOutSine"});
				   animsubs.alpha = 1;
				   animsubs.gotoAndPlay(1);
				   Tweener.addTween(f2, {x:147.45, y:916.65, alpha:1, time:0.5, delay:0.5, transition:"easeOutSine"});
				   status = 2;
				   tempf1 = f1_;
				   tempf2 = f2_;
			   }
					if (status == 2 && f1_ == tempf1 && f2_ != tempf2)
					{
						f2.alpha = 0;
						Tweener.addTween(f2, {x:147.45, y:916.65, alpha:1, time:0.5, delay:0.5, transition:"easeOutSine"});
						tempf1 = f1_;
						tempf2 = f2_;
					}
					
					if (status == 2 && f1_ != tempf1 && f2_ == tempf2)
					{
						f1.alpha = 0;
						Tweener.addTween(f1, {x:147.45, y:835.20, alpha:1, time:0.5, delay:0.5, transition:"easeOutSine"});
						tempf1 = f1_;
						tempf2 = f2_;
					}
					
					if (status == 2 && f1_ != tempf1 && f2_ != tempf2)
					{
						f1.alpha = 0;
						Tweener.addTween(f1, {x:147.45, y:835.20, alpha:1, time:0.5, delay:0.5, transition:"easeOutSine"});
						f2.alpha = 0;
						Tweener.addTween(f2, {x:147.45, y:916.65, alpha:1, time:0.5, delay:0.5, transition:"easeOutSine"});
						tempf1 = f1_;
						tempf2 = f2_;
					}
		   }
		}
				
		override public function Play():void
		{
			//Your code here
			//add it to the display list
			
			f0.alpha = 0;
			f1.alpha = 0;
			f2.alpha = 0;
			
			animsubs.alpha = 0;
			stage.addChildAt(animsubs,0);
			animsubs.x = 132,00;
			animsubs.y = 921,00;
			
			stage.addChildAt(animmain,0);
			animmain.x = 117,00;
			animmain.y = 835,00;
			
			CekKondisi();
		}
		
		function CekKondisi()
		{
			if (f0_ != "")
			{
				stage.addChildAt(animlokasi,0);
				animlokasi.x = 122,00;
				animlokasi.y = 70,00;
				f0.alpha = 0;
				f0.x = 162,95;
				f0.y = 70,65;
				ScaleDownTextFieldf0(f0_, f0);
				tempf0 = f0_;
				lstat = 1;
			}
			
			if (f0_ == "")
			{
				stage.addChildAt(animlokasi,0);
				animlokasi.x = 122,00;
				animlokasi.y = 70,00;
				animlokasi.alpha = 0;
				f0.alpha = 0;
				f0.x = 162,95;
				f0.y = 70,65;
				tempf0 = f0_;
				lstat = 0;
			}
			
			if (f1_ != "" && f2_ == "")
			{
				f1.width = 1471;
				ScaleDownTextFieldf1(f1_, f1);
				f1.alpha = 0;
				f2.alpha = 0;
				Tweener.addTween(f1, {x:147.45, y:849.25, alpha:1, scaleY:1, time:0.3, delay:0.3, transition:"easeOutSine"});
				status = 1;
			}
			
			if (f1_ != "" && f2_ != "")
			{
				f2.width = 1471;
				ScaleDownTextFieldf2(f2_, f2);
				animsubs.alpha = 1;
				Tweener.addTween(f2, {x:147.45, y:916.65, alpha:1, time:0.3, delay:0.3, transition:"easeOutSine"});
				status = 2;
				f1.width = 1471;
				ScaleDownTextFieldf1(f1_, f1);
				f1.alpha = 0;
				f2.alpha = 0;
				Tweener.addTween(f1, {x:147.45, y:851.10, alpha:1, scaleY:0.8, time:0.3, delay:0.3, transition:"easeOutSine"});
			}
		}
				
		override public function Stop():void
		{
   			//Your code here
			//add it to the display list 
			
			if (f0_ == "" && f1_ !== "" && f2_ == "")
			{
				animmain.gotoAndPlay(17);
				Tweener.addTween(f0, {time:0.1, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f1, {time:0.2, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f2, {time:0.2, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f0, {time:0.5, alpha:0, transition:"easeOutQuart", onComplete:Remove});
				//Tweener.addTween(f0, {time:0.5, alpha:0, transition:"easeOutQuart", onComplete:Remove});
			}
			
			if (f0_ !== "" && f1_ !== "" && f2_ == "")
			{
				animlokasi.gotoAndPlay(25);
				animmain.gotoAndPlay(17);
				Tweener.addTween(f0, {time:0.1, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f1, {time:0.2, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f2, {time:0.2, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f0, {time:0.5, alpha:0, transition:"easeOutQuart", onComplete:Remove});
			}
			
			if (f0_ == "" && f1_ !== "" && f2_ !== "")
			{
				animmain.gotoAndPlay(17);
				animsubs.gotoAndPlay(17);
				Tweener.addTween(f0, {time:0.1, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f1, {time:0.2, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f2, {time:0.2, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f0, {time:0.5, alpha:0, transition:"easeOutQuart", onComplete:Remove});
			}
			
			if (f0_ !== "" && f1_ !== "" && f2_ !== "")
			{
				animlokasi.gotoAndPlay(25);
				animmain.gotoAndPlay(17);
				animsubs.gotoAndPlay(17);
				Tweener.addTween(f0, {time:0.1, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f1, {time:0.2, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f2, {time:0.2, alpha:0, transition:"easeOutQuart"});
				Tweener.addTween(f0, {time:0.5, alpha:0, transition:"easeOutQuart", onComplete:Remove});
			}
		}
		
		function Remove() 
		{
			removeTemplate();
		}
	}
}
