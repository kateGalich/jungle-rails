

describe('Product Details page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('visit the product detail page', () => {
    cy.get('.products article a[href="/products/11"]').should('contain.text', 'Void Fennel')
    cy.get('#action-canvas').click(80, 75)
    cy.get(':nth-child(2) > div > .button_to > .btn').click({force: true})
  })

  
})
