

describe('home page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('visit the home page of Jungle App', () => {
    cy.get('body header section h1').should('have.text', 'The Jungle')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
  
})
