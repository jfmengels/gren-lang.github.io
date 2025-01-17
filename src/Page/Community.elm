module Page.Community exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attribute
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head _ =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Gren"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "Gren logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Join Gren's community"
        , locale = Nothing
        , title = "Gren - Community"
        }
        |> Seo.website


type alias Data =
    ()


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View msg
view _ _ _ =
    { title = "Gren - Community"
    , body =
        [ Html.h3 []
            [ Html.text "Community" ]
        , Html.p []
            [ Html.text "There are several ways to keep tabs on the Gren community." ]
        , Html.p []
            [ Html.a
                [ Attribute.href "https://gren.zulipchat.com/"
                , Attribute.title "Join our Zulip"
                ]
                [ Html.text "Zulip" ]
            , Html.text " is the official meeting place for people who are curious about Gren. "
            , Html.text "The core team posts weekly development updates here, and there are also "
            , Html.text "channels for beginners to ask questions, and for random discussion."
            ]
        , Html.p
            []
            [ Html.text "Our official "
            , Html.a
                [ Attribute.href "https://twitter.com/gren_lang"
                , Attribute.title "Follow us on Twitter"
                ]
                [ Html.text "twitter account" ]
            , Html.text " might be worth following if you want to be notified of anything interesting "
            , Html.text "every now and again."
            ]
        , Html.p
            []
            [ Html.text "If you want to keep up-to-date on the actual development of Gren, "
            , Html.text "you can find the source code and issue-tracker at "
            , Html.a
                [ Attribute.href "https://github.com/gren-lang"
                , Attribute.title "Read the source on Github"
                ]
                [ Html.text "Github" ]
            , Html.text "."
            ]
        ]
    }
