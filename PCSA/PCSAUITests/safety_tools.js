
var target = UIATarget.localTarget();

target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Safety Tools"].tap();
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Personal Security Strategies"].tap();
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["RADAR"].tap();
target.frontMostApp().mainWindow().scrollViews()[0].textViews()["Be aware of what is going on around you – be on the lookout for suspicious people and for situations that could pose a danger. \n\nBe aware of how others perceive you – are your actions or dress inadvertently attracting unwanted attention?  Are you wearing jewelry, using a camera, working on a laptop, or flashing money that might grab the attention of a criminal?\n\nBeing able to recognize dangers lets us begin to figure out ways to reduce the risks. This is where it’s important to trust your instincts. If you have a bad feeling about something it’s a warning sign. Don’t dismiss it – listen to what that voice in the back of your head is saying or that uneasy feeling in your stomach is telling you.  For example, when you walk in to a crowded bus terminal, you recognize that there is a risk of being pickpocketed. "].scrollToVisible();
target.frontMostApp().mainWindow().scrollViews()[0].textViews()["Now that you have recognized a potentially dangerous situation, what can you do in order to reduce the risk you face? In most situations, you will have choices to make. Identify as many options as you can.  For example, you can mitigate the risk of going out at night by traveling in a group, by using a trusted taxi or even by choosing to return home at an earlier hour."].scrollToVisible();
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["RADAR"].tap();
target.frontMostApp().mainWindow().scrollViews()[0].textViews()["Be aware of what is going on around you – be on the lookout for suspicious people and for situations that could pose a danger. \n\nBe aware of how others perceive you – are your actions or dress inadvertently attracting unwanted attention?  Are you wearing jewelry, using a camera, working on a laptop, or flashing money that might grab the attention of a criminal?\n\nBeing able to recognize dangers lets us begin to figure out ways to reduce the risks. This is where it’s important to trust your instincts. If you have a bad feeling about something it’s a warning sign. Don’t dismiss it – listen to what that voice in the back of your head is saying or that uneasy feeling in your stomach is telling you.  For example, when you walk in to a crowded bus terminal, you recognize that there is a risk of being pickpocketed. "].scrollToVisible();
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Coping with Unwanted Attention Strategies"].tap();
target.dragFromToForDuration({x:148.00, y:338.50}, {x:152.50, y:147.50}, 0.6);
target.tap({x:22.50, y:45.00});
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Tactics of Sexual Predators"].tap();

target.tap({x:44.50, y:68.50});
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Bystander Intervention"].tap();
target.dragFromToForDuration({x:140.50, y:304.50}, {x:140.50, y:126.00}, 0.8);
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Safety Plan Basics"].tap();
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Safety Plan Worksheet"].tap();
target.frontMostApp().mainWindow().scrollViews()[0].textViews()["Have you anticipated where and in which ways you might come into contact with the perpetrator and perpetrator’s friends/family?\n\nIf you were to come into contact with the perpetrator and perpetrator’s family/friends, what specific things could you do that might help you feel safe in that situation?\n\nHave you thought about making a plan in case of emergencies of who you could call, where you could go, and how you could get there? How can Peace Corps assist you in developing this plan?\n"].scrollToVisible();
target.frontMostApp().mainWindow().scrollViews()[0].textViews()["Have you anticipated where and in which ways you might come into contact with the perpetrator and perpetrator’s friends/family?\n\nIf you were to come into contact with the perpetrator and perpetrator’s family/friends, what specific things could you do that might help you feel safe in that situation?\n\nHave you thought about making a plan in case of emergencies of who you could call, where you could go, and how you could get there? How can Peace Corps assist you in developing this plan?\n"].tapWithOptions({tapOffset:{x:0.50, y:0.92}});
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().navigationBar().leftButton().tap();
