//
//  DraggableViewBackground.m
//  testing swiping
//
//  Created by Richard Kim on 8/23/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "DraggableViewBackground.h"

@implementation DraggableViewBackground{
    NSInteger cardsLoadedIndex; //%%% the index of the card you have loaded into the loadedCards array last
    NSMutableArray *loadedCards; //%%% the array of card loaded (change max_buffer_size to increase or decrease the number of cards this holds)

    UIButton* menuButton;
    UIButton* messageButton;
    UIButton* checkButton;
    UIButton* xButton;
}
//this makes it so only two cards are loaded at a time to
//avoid performance and memory costs
static const int MAX_BUFFER_SIZE = 2; //%%% max number of cards loaded at any given time, must be greater than 1
static const float CARD_HEIGHT = 300; //%%% height of the draggable card
static const float CARD_WIDTH = 320; //%%% width of the draggable card

@synthesize exampleCardLabels; //%%% all the labels I'm using as example data at the moment
@synthesize allCards;//%%% all the cards

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [super layoutSubviews];
        [self setupView];
        exampleCardLabels = [[NSMutableArray alloc] init]; //%%% placeholder for card-specific information
        loadedCards = [[NSMutableArray alloc] init];
        allCards = [[NSMutableArray alloc] init];
        cardsLoadedIndex = 0;
        // [self loadCards];
    }
    return self;
}

-(int)loadedCardsCount
{
    return [loadedCards count];
}

-(void)removeCards
{
    loadedCards =[[NSMutableArray alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];

}

//%%% sets up the extra buttons on the screen
-(void)setupView
{
// #warning customize all of this.  These are just place holders to make it look pretty
    self.backgroundColor = [UIColor colorWithRed:.92 green:.93 blue:.95 alpha:0.0]; //the gray background colors
    // self.backgroundColor = [UIColor colorWithWhite:myWhiteFloat alpha:myAlphaFloat];

    // menuButton = [[UIButton alloc]initWithFrame:CGRectMake(17, 34, 22, 15)];
    // [menuButton setImage:[UIImage imageNamed:@"menuButton"] forState:UIControlStateNormal];
    // messageButton = [[UIButton alloc]initWithFrame:CGRectMake(284, 34, 18, 18)];
    // [messageButton setImage:[UIImage imageNamed:@"messageButton"] forState:UIControlStateNormal];
    // xButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 485, 59, 59)];
    // [xButton setImage:[UIImage imageNamed:@"xButton"] forState:UIControlStateNormal];
    // [xButton addTarget:self action:@selector(swipeLeft) forControlEvents:UIControlEventTouchUpInside];
    // checkButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 485, 59, 59)];
    // [checkButton setImage:[UIImage imageNamed:@"checkButton"] forState:UIControlStateNormal];
    // [checkButton addTarget:self action:@selector(swipeRight) forControlEvents:UIControlEventTouchUpInside];
    // // [self addSubview:menuButton];
    // // [self addSubview:messageButton];
    // // [self addSubview:xButton];
    // // [self addSubview:checkButton];
}

// #warning include own card customization here!
//%%% creates a card and returns it.  This should be customized to fit your needs.
// use "index" to indicate where the information should be pulled.  If this doesn't apply to you, feel free
// to get rid of it (eg: if you are building cards from data from the internet)
-(DraggableView *)createDraggableViewWithDataAtIndex:(NSInteger)index
{
    DraggableView *draggableView = [[DraggableView alloc]initWithFrame:CGRectMake((self.frame.size.width - CARD_WIDTH)/2, (self.frame.size.height - CARD_HEIGHT)/2, CARD_WIDTH, CARD_HEIGHT)];
    draggableView.transName.text = [allCards objectAtIndex:index]; //%%% placeholder for card-specific information
    draggableView.delegate = self;
    return draggableView;
}

-(DraggableView *)createDraggableViewWithDataName:(NSString *)transName withAmount:(NSString *)amount withDate:(NSString *)date withCategory:(NSString *)category //withTransaction:(NSString *)transactionId
{
    DraggableView *draggableView = [[DraggableView alloc]initWithFrame:CGRectMake((self.frame.size.width - CARD_WIDTH)/2, (self.frame.size.height - CARD_HEIGHT)/3, CARD_WIDTH, CARD_HEIGHT)];
    draggableView.transName.text = transName; //%%% placeholder for card-specific information
    draggableView.amount.text = [NSString stringWithFormat:@"$%@", amount];
    // NSLog([NSString stringWithFormat:@"left........ %1.6f", xFromCenter]);
    draggableView.date.text = date;
    draggableView.category.text = category;
    // draggableView.transactionId = transactionId;
    draggableView.delegate = self;
    return draggableView;
}

-(void)addCard:(DraggableView *)newCard
{
    [allCards addObject:newCard];

}


//%%% loads all the cards and puts the first x in the "loaded cards" array
-(int)loadCards
{
    if([allCards count] > 0) {
        NSInteger numLoadedCardsCap =((([allCards count] > MAX_BUFFER_SIZE) || ([allCards count] == 0))?MAX_BUFFER_SIZE:[allCards count]);
        //%%% if the buffer size is greater than the data size, there will be an array error, so this makes sure that doesn't happen

        //%%% loops through the exampleCardsLabels array to create a card for each label.  This should be customized by removing "allCards" with your own array of data
        for (int i = 0; i<[allCards count]; i++) {
            // DraggableView* newCard = [self createDraggableViewWithDataAtIndex:i];
            // [allCards addObject:newCard];

            if (i<numLoadedCardsCap) {
                //%%% adds a small number of cards to be loaded
                [loadedCards addObject:[allCards objectAtIndex:i]];
            }
        }

        //%%% displays the small number of loaded cards dictated by MAX_BUFFER_SIZE so that not all the cards
        // are showing at once and clogging a ton of data
        for (int i = 0; i<[loadedCards count]; i++) {
            if (i>0) {
                [self insertSubview:[loadedCards objectAtIndex:i] belowSubview:[loadedCards objectAtIndex:i-1]];
            } else {
                [self addSubview:[loadedCards objectAtIndex:i]];
            }

            cardsLoadedIndex++; //%%% we loaded a card into loaded cards, so we have to increment
        }
        DraggableView *c = (DraggableView *) loadedCards[0];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject: c.transactionId forKey:@"currentCard"];
    }
    return [loadedCards count];
}

// #warning include own action here!
//%%% action called when the card goes to the left.
// This should be customized with your own action
-(void)cardSwipedLeft:(UIView *)card;
{
    //do whatever you want with the card that was swiped
    DraggableView *c = (DraggableView *)card;

    [loadedCards removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    // [loadedCards removeObjectAtIndex:0]

    if (cardsLoadedIndex < [allCards count]) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;//%%% loaded a card, so have to increment count
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];

    }
    DraggableView *cNew = (DraggableView *) loadedCards[MAX_BUFFER_SIZE-2];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cNew.transactionId forKey:@"currentCard"];

    [defaults setObject: c.transactionId forKey:@"cardSwiped"];
    [defaults setObject:@"personal" forKey:@"cardExpenseType"];
    [defaults synchronize];
}

// #warning include own action here!
//%%% action called when the card goes to the right.
// This should be customized with your own action
-(void)cardSwipedRight:(UIView *)card
{
    //do whatever you want with the card that was swiped
    DraggableView *c = (DraggableView *)card;

    [loadedCards removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"

    if (cardsLoadedIndex < [allCards count]) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;//%%% loaded a card, so have to increment count
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }
    DraggableView *cNew = (DraggableView *) loadedCards[MAX_BUFFER_SIZE-2];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cNew.transactionId forKey:@"currentCard"];

    [defaults setObject:c.transactionId forKey:@"cardSwiped"];
    [defaults setObject:@"business" forKey:@"cardExpenseType"];
    [defaults synchronize];

}

//%%% when you hit the right button, this is called and substitutes the swipe
-(void)swipeRight
{
    DraggableView *dragView = [loadedCards firstObject];
    dragView.overlayView.mode = GGOverlayViewModeRight;
    [UIView animateWithDuration:0.2 animations:^{
        dragView.overlayView.alpha = 1;
    }];
    [dragView rightClickAction];
}

//%%% when you hit the left button, this is called and substitutes the swipe
-(void)swipeLeft
{
    DraggableView *dragView = [loadedCards firstObject];
    dragView.overlayView.mode = GGOverlayViewModeLeft;
    [UIView animateWithDuration:0.2 animations:^{
        dragView.overlayView.alpha = 1;
    }];
    [dragView leftClickAction];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
