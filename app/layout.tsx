import './globals.css';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'My Next.js App',
  description: 'A simple Next.js starter project',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="bg-gray-50 text-gray-900">
        <header className="p-4 shadow-md bg-white">
          <h1 className="text-2xl font-semibold text-center">My Next.js App</h1>
        </header>
        <main className="p-6">{children}</main>
      </body>
    </html>
  );
}