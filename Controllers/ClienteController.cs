using Microsoft.AspNetCore.Mvc;

public class ClienteController : Controller
{
    private readonly ApplicationDbContext _context;

    public ClienteController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public IActionResult Index()
    {
        var clientes = _context.Clientes.ToList();
        return View(clientes);
    }

    [HttpPost]
    public IActionResult Create(Cliente cliente)
    {
        if (ModelState.IsValid)
        {
            _context.Clientes.Add(cliente);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        return View(cliente);
    }
}
