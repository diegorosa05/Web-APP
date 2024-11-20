using Microsoft.AspNetCore.Mvc;

public class EstoqueController : Controller
{
    private readonly ApplicationDbContext _context;

    public EstoqueController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public IActionResult Index()
    {
        var estoques = _context.Estoques.ToList();
        return View(estoques);
    }
}
