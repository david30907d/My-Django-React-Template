import React, { Component } from 'react'
import {
  Button,
  Container,
  Divider,
  Grid,
  Header,
  Icon,
  Image,
  List,
  Menu,
  Segment,
  Visibility,
} from 'semantic-ui-react'
import Footer from './footer.jsx'
import FixedMenu from './FixedMenu.jsx'
import UpperMenu from './UpperMenu.jsx'

export default class HomepageLayout extends Component {
  constructor(props) {
    super(props)
    this.state = {}
    this.hideFixedMenu = this.hideFixedMenu.bind(this)
    this.showFixedMenu = this.showFixedMenu.bind(this)
  }

  hideFixedMenu() {
    this.setState({ visible: false })
  }

  showFixedMenu() {
    this.setState({ visible: true })
  }

  render() {
    const { visible } = this.state

    return (
      <div>
        { visible ? <FixedMenu active='首頁'/> : null }

        <Visibility
          onBottomPassed={this.showFixedMenu}
          onBottomVisible={this.hideFixedMenu}
          once={false}
        >
          <Segment
            inverted
            textAlign='center'
            style={{ minHeight: 700, padding: '1em 0em' }}
            vertical
          >
            <UpperMenu active='首頁'/>

            <Container text>
              <Header
                as='h1'
                content='普及資料與智慧運算'
                inverted
                style={{ fontSize: '4em', fontWeight: 'normal', marginBottom: 0, marginTop: '3em' }}
              />
              <Header
                as='h1'
                content='實驗室'
                inverted
                style={{ fontSize: '4em', fontWeight: 'normal'}}
              />
              <Header
                as='h2'
                content="if you can't explain it simply, you don't understand it well enough --Albert Einstein"
                inverted
                style={{ fontSize: '1.7em', fontWeight: 'normal' }}
              />
              <Button primary size='huge'>
                體驗API
                <Icon name='right arrow' />
              </Button>
            </Container>
          </Segment>
        </Visibility>

        <Segment style={{ padding: '8em 0em' }} vertical>
          <Grid container stackable verticalAlign='middle'>
            <Grid.Row>
              <Grid.Column width={8}>
                <Header as='h3' style={{ fontSize: '2em' }}>Research Interesting  /What I would like to do</Header>
                <p style={{ fontSize: '1.33em' }}>
                <ul>
                  <li>Data Mining</li>
                  <li>Big Data Management</li>
                  <li>Crowdsourcing</li>
                  <li>Social Networks</li>
                  <li>Mobile Data Management and Application Development</li>
                  <li>Ubiquitous Computing</li>
                </ul>
                </p>
              </Grid.Column>
              <Grid.Column floated='right' width={6}>
                <Image
                  bordered
                  size='large'
                  src='https://tctechcrunch2011.files.wordpress.com/2017/03/brain-ai-newsletter.jpg?w=640'
                />
              </Grid.Column>
            </Grid.Row>
            <Grid.Row>
              <Grid.Column textAlign='center'>
                <Button size='huge'>Check Them Out</Button>
              </Grid.Column>
            </Grid.Row>
          </Grid>
        </Segment>

        <Segment style={{ padding: '8em 0em' }} vertical>
          <Container text>
            <Header as='h3' style={{ fontSize: '2em' }}>研究動機</Header>
            <p style={{ fontSize: '1.33em' }}>
              我們實驗室主要於資料庫查詢處理與資料探勘技術領域進行研究；各種不同資訊平台及其應用所產生的資料，帶著不同的資料屬性與不同的環境應用需求，也產生多樣化的研究議題，持續地推進資料工程(Data Engineering)研究領域向前發展。而這樣的發展也伴隨資訊技術的更貼近日常生活而有著持續加快的趨勢。
            </p>
            <Button as='a' size='large'>Read More</Button>

            <Header as='h3' style={{ fontSize: '2em' }}>研究目標</Header>
            <p style={{ fontSize: '1.33em' }}>
            我們以資料工程技術為出發點考慮各式不一樣應用環境中所產生的資料進行該類型資料之查詢處理與探勘。而就近期研究規劃目標而言，我們規劃三近程研究目標：(1)社群媒體輿情分析(Social Media Analysis)，(2)行動裝置使用者行為探勘(Mobile Data Analysis)，(3)平行與分散式資料處理架構(Parallel and Distributed Data Processing)。而就遠程研究重心而言，我們將仍以資料工程知識為核心，配合於各式現有資通平台上所累積之資料分析與查詢處理經驗，朝向未來可預見之更多樣化之平台與資料類型資料管理應用發展
            </p>
            <Button as='a' size='large'>Read More</Button>
          </Container>
        </Segment>

        <Footer/>
      </div>
    )
  }
}
