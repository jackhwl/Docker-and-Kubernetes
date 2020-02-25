import React, { Component } from 'react'
import axios from 'axios'

class Fib extends Component {
    state = {
        seeIndexes: [],
        values: {},
        index: ''
    }
    componentDidMount() {
        this.fetchValues()
        this.fetchIndexes()
    }

    async fetchValues() {
        const values = await axios.get('/api/values/current')
        this.setState({ values: values.data })
    }

    async fetchIndexes() {
        const seenIndexes = await axios.get('/api/values/all')
        this.setState({ seenIndexes: seenIndexes.data })
    }

    render() {
        return (
            <div>
                
            </div>
        )
    }
}