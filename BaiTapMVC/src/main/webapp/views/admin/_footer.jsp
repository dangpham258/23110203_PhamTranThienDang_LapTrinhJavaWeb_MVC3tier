    </div> <!-- /.admin-content -->
    <footer class="footer">© Admin Area</footer>
  </main>
</div> <!-- /.admin-layout -->

<script>
document.addEventListener('DOMContentLoaded', function () {
  const inputs = document.querySelectorAll('input[type="file"][name="icon"]');
  inputs.forEach(function (input) {
    input.addEventListener('change', function () {
      const file = this.files && this.files[0];
      if (!file) return;
      const preview = document.querySelector('#preview') || document.querySelector('.thumb-preview');
      if (preview) {
        preview.src = URL.createObjectURL(file);
        preview.classList.remove('hidden');
      }
    });
  });
});
</script>
</body>
</html>
